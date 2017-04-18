import Kitura
import HeliumLogger
import KituraMustache

HeliumLogger.use()

let router = Router()

router.add(templateEngine: MustacheTemplateEngine())

router.all("/name", middleware: BodyParser())

router.get("/jobs/:state/:city/:title") { request, response, next in
    let state = request.parameters["state"] ?? ""
    let city = request.parameters["city"] ?? ""
    let title = request.parameters["title"] ?? ""
    response.send("State: \(state)\n")
    response.send("City: \(city)\n")
    response.send("Title: \(title)\n")
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
