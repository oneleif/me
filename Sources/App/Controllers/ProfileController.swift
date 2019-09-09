import Vapor
import Leaf

class ProfileController: RouteCollection {
	func boot(router: Router) throws {
		router.get(use: indexHandler)
	}

	func indexHandler(_ req: Request) throws -> Future<View> {
		let context = ProfileContext(title: "Hello World",
			       name: "Zach Eriksen",
			       bio: "Swift Developer",
			       email: "zmeriksen@icloud.com",
			       phone: "123-456-7890",
			       location: "Remote",
			       socialMedia: [
				       Social(title: "Twitter", url: "https://www.twitter.com/zmeriksen")
			       ],
			       experiences: [
				       Experience(title: "iOS Developer", company: "From Now On", time: "2 Months", description: "Lead iOS Developer")
			       ],
			       skills: [
				       Skill(title: "Swift"),
				       Skill(title: "Vapor", description: "Backend Swift Web Framework")
			       ],
			       links: [
				       Link(title: "oneleif",  url: "https://oneleif.github.io/olPages/", description: "Open Source Development Group"),
				       Link(title: "twoleif", url: "https://www.twoleif.com")
			       ])
		return try req.view().render("index", context)

	}

}

struct Social: Encodable {
	let title: String
	let url: String
}

struct Experience: Encodable {
	let title: String
	let company: String
	let time: String
	let description: String?

	init(title: String, company: String, time: String, description: String? = nil) {
		self.title = title
		self.company = company
		self.time = time
		self.description = description
	}
}

struct Skill: Encodable {
	let title: String
	let description: String?

	init(title: String, description: String? = nil) {
		self.title = title
		self.description = description
	}
}

struct Link: Encodable {
	let title: String
	let description: String?
	let url: String

	init(title: String, url: String, description: String? = nil) {
		self.title = title
		self.description = description
		self.url = url
	}
}

struct ProfileContext: Encodable {
	// Profile Info
	let title: String
	let name: String
	let bio: String
	let email: String
	let phone: String
	let location: String
	let socialMedia: [Social]
	// Work Experience
	let experiences: [Experience]
	// Awards / Skills
	let skills: [Skill]
	// Links
	let links: [Link]
}
