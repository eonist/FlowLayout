import Foundation

public class NetworkAsserter {
	/**
	 * Asserts if the device is connected to internet
	 * - Note: works in IOS and OSX
    * - Fixme: ⚠️️ Needs more work, see stackoverflow https://stackoverflow.com/questions/30743408/check-for-internet-connection-with-swift
	 */
	public static func isConnectedToInternet() -> Bool {
	   /*
        
        Fixme: Needs research
        
        let url = NSURL(string: "http://google.com/")
	  let request = NSMutableURLRequest(URL: url!)
	  request.HTTPMethod = "HEAD"
	  request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
	  request.timeoutInterval = 10.0
	  var response: NSURLResponse?
     
	  let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
	  print(data)
      if let httpResponse = response as? NSHTTPURLResponse {
	      if httpResponse.statusCode == 200 {
	          return true
	      }
	  }
        */
	  return false
	}
}
