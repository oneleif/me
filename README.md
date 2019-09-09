<p align="center">
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
</p>
