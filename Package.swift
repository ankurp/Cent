import PackageDescription

let package = Package(
    name: "Cent",
    dependencies: [ 
        .Package(url: "https://github.com/ankurp/Dollar", majorVersion: 5, minor: 1)
    ])
