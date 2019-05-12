//
//  AbstractCoordinator.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

/**
 The AbstractCoordinator is an abstract class instantiates and defines all the variables and methods that are common in all
 of its subclasses. Not intended to be instantiated directly.
 */
open class AbstractCoordinator: Coordinator {
    
    public init() {
        guard type(of: self) != AbstractCoordinator.self else {
            fatalError(
                "AbstractCoordinator instances cannot be created. Use subclasses instead"
            )
        }
    }
    
    // MARK: Stored Properties
    /**
     Instance variable of an array of childCoordinators
     */
    private var _childCoordinators: [Coordinator] = []
    
    /**
     Boolean to trigger a crash if start method is called multiple times in the lifetime of the instance.
     */
    public private(set) var hasStarted: Bool = false
    
    // MARK: Computed Properties
    public var childCoordinators: [Coordinator] {
        return self._childCoordinators
    }
    
    // MARK: Instance Methods
    // Before you start a coordinator, add the coordinator to the child
    open func start() {
        switch self.hasStarted {
        case true:
            fatalError(
                """
                \(#function) has already been called once in the lifetime of this coordinator.
                \(#function) is only intended to be called once.
                """
            )
            
        case false:
            self.hasStarted = true
        }
    }
    
    public func add(childCoordinator coordinator: Coordinator) {
        self._childCoordinators.append(coordinator)
    }
    
    public func remove(childCoordinator coordinator: Coordinator) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
