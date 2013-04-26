var xdr = {
                /* request ID, JSONP counter*/
                reqId : 0,
                req : {},
                /* Prevent caching*/   
                prepareUrl : function(url){
                      /*  url = /\?/.test(url) ? url + "&" + seed : url + "?" + seed; */
                        return url;
                },
                /*
                 *
                 */
                xget : function(url, onDone){
                        url = this.prepareUrl(url);
                        if (window.opera && window.opera.defineMagicVariable){
                                this.scriptTransport(url, onDone);
                        } else if(chrome && chrome.extension) {
                                this.xhrTransport(url, onDone);
                        } else if (GM_xmlhttpRequest){
                                this.GMTransport(url,onDone);
                        } else {
                                var currentReqId = this.reqId++;
                                this.req[currentReqId].handleJSONP = onDone;
                               
                                this.JSONPTransport(url, "xdr.req["+currentReqId+"].handleJSONP");
                        }
                },
               
                /**
                 * Make GET request via <script> transport.
                 *
                 */
                scriptTransport : function(url, onDone){
                        var t = document.createElement("script");
                        t.src = url;
                        t._callback = onDone;
                        document.body.appendChild(t);
                },
               
                // transport should be proxyed via background.html of the chrome
                // extension
                xhrTransport : function(url, onDone){
                        chrome.extension.sendRequest({'action' : 'xget', 'url':url}, onDone);
                },
                /**
                 * Make GET request via GM_xmlhttpRequest.
                 *
                 */
                GMTransport : function(url, onDone){
                        setTimeout(function(){GM_xmlhttpRequest({
                                method : "GET",
                                url : url,
                                onload : function(x) {
                                        var o = x.responseText;
                                        if (onDone) {
                                                onDone(o);
                                        }
                                }
                        });},0);
               
                },
                JSONPTransport : function(url, callbackName ){
                        if (callbackName && typeof callbackName == "string"){
                                url += "&callback="+callbackName;
                        }
                        var t = document.createElement("script");
                        t.src = url;
                        document.body.appendChild(t);
                }
        }
 