import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
	let profileController = ProfileController()
	try router.register(collection: profileController)
}

struct ProfileContext: Encodable {
	let title: String
	let name: String
	let bio: String
}
