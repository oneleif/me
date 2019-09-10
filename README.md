<p align="center">
	<h1>Setup</h1>
	
- First find the file `ProfileController.swift` (me/Sources/App/Controllers/ProfileController.swift)
- Next fill in the correct information for the `ProfileContext` on `line 10`
- Lastly go to the **root directiory** of the project and run:
	- `vapor build`
	- `vapor run`

<h1>Models</h1>
   
```
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
```

<h1>Deployment</h1>

- First head to [vapor.cloud](https://dashboard.vapor.cloud/login)
	- Register / Login
- Next create an origization and project for your site
- Lastly in the terminal enter these commands:
	- `vapor cloud login`
		- login
	- `vapor cloud deploy`

You should have a vapor instance up very quickly!

<h2>Extra Help</h2>

Fell free to make an issue if you are having difficulties.

Also here is the code you should be lookin for you make changes to:

```
class ProfileController: RouteCollection {
	func boot(router: Router) throws {
		router.get(use: indexHandler)
	}

	func indexHandler(_ req: Request) throws -> Future<View> {
		let context = ProfileContext(title: "Hello World",
			       name: "John Doe",
			       bio: "Developer",
			       email: "someemail@some.com",
			       phone: "123-456-7890",
			       location: "Remote",
			       socialMedia: [
				       Social(title: "Twitter", url: "https://www.twitter.com/"),
						Social(title: "LinkedIn", url: "https://www.linkedin.com/in/"),
						Social(title: "GitHub", url: "https://github.com/"),
						Social(title: "GitLab", url: "https://gitlab.com/"),
						Social(title: "Medium", url: "https://medium.com/")
			       ],
			       experiences: [
			
			Experience(title: "Developer", company: "Qwertiplex", time: "Sept 2019 - Present", description: "Worked as a Developer.")
				      ],
			       skills: [
				       Skill(title: "Git"),
				       Skill(title: "Vapor", description: "Backend Swift Web Framework")
			       ],
			       links: [
				       Link(title: "oneleif",  url: "https://oneleif.github.io/olPages/", description: "Open Source Development Group"),
						Link(title: "Learn Swift Omaha!", url: "https://www.meetup.com/LearnSwiftOmaha/")
			       ])
		return try req.view().render("index", context)

	}

}
```
</p>
