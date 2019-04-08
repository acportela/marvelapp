# Marvell App
Fartfech Brazil Challenge

# **Third party libraries**
To be honest, I didn't realize there was a limitation on the number of libraries
until it was too late to change. Sorry for that... can I explain why I chose them?

**AlamoFire**
I could have used the native URLSession class,
even though I find it more readable and simpler to validate response.

**Kingfisher**
Helps loading and caching images.
Since this app needs to handle a good amount,
I figured it was a reasonable choice to keep things simple.

**Snapkit**
Natively setting up constraints is a real pain in the neck.
This library eases the process of coding views programatically.

**Swift Lint**
Helps a lot with code styling

**CryptoSwfit**
Used to generate a hash of the timestamp, and api keys.
This was probably an overkill.

**Cocoapods Keys**
Used to store keys in the mac keychain in order to avoid keeping them in plain text.
When running 'pod install' the user is prompted to insert its api keys.

**Quick and Nimble**
Used for simplifying and better organizing tests.
Readability is also vastly improved in my opinion.