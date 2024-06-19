![App Icon Image](Icon.png)

# Implementing Universal Links

This project contains a set of simple samples, to accompany [a blog series](https://littlegreenviper.com/implementing-universal-links/), about implementing [Apple Universal Links](https://developer.apple.com/ios/universal-links/), in [iOS](https://apple.com/ios).

## The Big Picture

### What is A "Universal Link"?

[Universal Links](https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app) are an option that Apple has provided its app developers, since 2015 (iOS9).

Quite simply, it's a link that will open any Web page, but, if executed on a device with a specially-tuned app, will, instead, open the app, in the same manner as the standard [URL Scheme](https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference) (AKA "Deep Links").

"Deep Links" are something that iOS apps have been able to leverage for a very long time (Deep Links have been available since iOS2). They aren't especially difficult to add to your project, and give the ability to have a URL that is a "one-tap" direct access to the app.

In my own work, I use Universal Links as a "fallback." The app can send an email that contains a link to a user's profile page, for example. In my app, the user page is only visible (and useful) to those who have the app installed. The app needs to be opened, and the user's profile page is then shown. However, if the app is not installed, a universal link, instead, redirects the user to the Apple App Store page for that app.

A redirect is not always what folks may want. For example, there may be a Web interface for the app, and we may want to open the user's profile page on the Web, in lieu of the app they don't have.

If I used the classic "Deep Link" service, the app would open fine, if it was installed, but the user would get an ugly error, if it was not.

### Advantages

1. **One Link to Rule Them All**
No need to have two different links; one, to the app, and the other, to a Web page that provides the information in a more generic fashion (or an App Store link).

2. **No Ugly "Unable to Open Resource" Error**
A deep link will cause the user to see a fairly unattractive error, if the app is not installed. With a Universal Link, you simply get a Web page, if the app is not available.

3. **You Can Introduce New Users to Your App**
If the user is sent an email, for example, with a universal link, then that link might actually be a link to the App Store.
This is a way to recruit new users in the best possible way; so they can access information that they actually want to see.
No need to "push" users to your app. The link will "pull" them to you.

### Disadvantages

1. **More Involved Implementation**
You'll need to jump through a few extra hoops, to implement Universal Links, compared to Deep Links. You'll need a Web server and DNS provider, as well as the app development environment. You'll need someone that knows how to deal with the Web site, and someone to keep it running, after the app has been released.
This will add additional resources, costs, documentation, planning, security, and support infrastructure to a project.

2. **More Places for Things to Go Wrong**
Since this requires a Web site, as well as the app, there will be a couple of extra "weak spots," that could cause issues.

3. **Possible Security Issues**
If the app is installed on your device, no network activity happens outside the device, and the app is opened quickly; but if the app is not installed, it's likely that your device will make an external network call. This might be considered a possible security issue. Additionally, if the Web site is compromised, it could create a vector for network intrusion or malware delivery.
A Deep Link simply causes an on-device error, and nothing is sent anywhere. If someone without the app gets the link, it likely won't do them much good.

In my own experience, with the types of apps that I've written, Universal Links are a "no brainer." That said, there's definitely a need to consider the downsides, for some implementations.
