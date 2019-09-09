import Vapor
import Leaf

class ProfileController: RouteCollection {
	func boot(router: Router) throws {
		router.get(use: indexHandler)
	}

	func indexHandler(_ req: Request) throws -> Future<View> {
			let context = ProfileContext(title: "Hello World",
				name: "Zach Eriksen",
				bio: "Swift Developer")
			return try req.view().render("index", context)

	}

}
