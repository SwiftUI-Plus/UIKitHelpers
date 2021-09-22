import SwiftUI

/// Provides a convenient 'wrapper' around a UIView
public struct UIWrapping<V>: View {
    let wrapped: AnyView
    public var body: some View { wrapped }
}

extension UIWrapping {
    /// Instantiates a wrapper for a `UIView`
    /// - Parameters:
    ///   - viewProvider: Use this closure to return an instantiated `UIView`
    ///   - updateHandler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    public init(_ provider: @escaping RepresentableProvider<V>, update handler: (RepresentableUpdater<V>)? = nil) where V: UIView {
        wrapped = AnyView(
            ViewWrapper(
                provider: provider,
                updater: handler
            )
        )
    }

    /// Instantiates a wrapper for a `UIView` – uses `.init(frame:)`
    /// - Parameters:
    ///   - type: The type of `UIView` to wrap
    ///   - updateHandler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    public init(_ type: V.Type = V.self, update handler: @escaping (V) -> ()) where V: UIView {
        wrapped = AnyView(
            ViewWrapper(
                provider: { V.init(frame: .zero) },
                updater: handler
            )
        )
    }
}

extension UIWrapping {
    /// Instantiates a wrapper for the specified viewProvider
    /// - Parameters:
    ///   - viewProvider: Use this closure to return an instantiated `UIView`
    ///   - updateHandler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    public init(_ provider: @escaping RepresentableProvider<V>, update handler: (RepresentableUpdater<V>)? = nil) where V: UIViewController {
        wrapped = AnyView(
            ViewControllerWrapper(
                provider: provider,
                updater: handler
            )
        )
    }

    /// Instantiates a wrapper for a `UIViewController` – uses `.init(nibName:bundle:)`
    /// - Parameters:
    ///   - type: The type of `UIViewController` to wrap
    ///   - handler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    public init(_ type: V.Type = V.self, update handler: @escaping (V) -> ()) where V: UIViewController {
        wrapped = AnyView(
            ViewControllerWrapper(
                provider: { V.init(nibName: nil, bundle: nil) },
                updater: handler
            )
        )
    }
}

public typealias RepresentableProvider<V> = () -> V
public typealias RepresentableUpdater<V> = (V) -> ()

private struct ViewWrapper<V: UIView>: UIViewRepresentable {
    let provider: RepresentableProvider<V>
    let updater: RepresentableUpdater<V>?

    func makeUIView(context: Context) -> V {
        provider()
    }

    func updateUIView(_ view: V, context: Context) {
        view.backgroundColor = .clear
        updater?(view)
    }
}

private struct ViewControllerWrapper<V: UIViewController>: UIViewControllerRepresentable {
    public typealias Provider = () -> V
    public typealias Updater = (V) -> Void

    let provider: Provider
    let updater: Updater?

    func makeUIViewController(context: Context) -> V {
        provider()
    }

    func updateUIViewController(_ controller: V, context: Context) {
        controller.view.backgroundColor = .clear
        updater?(controller)
    }
}

struct UIWrapping_Preview: PreviewProvider {
    static var previews: some View {
        UIWrapping<UILabel> { view in
            view.numberOfLines = 0
            view.text = "Lets enable\nmultiple lines"
            view.textAlignment = .center
        }
        .fixedSize()
    }
}
