package gitService;

import ballerina.lang.messages;
import ballerina.net.http;

@http:configuration {basePath:"/authentication"}
service<http> session {

    @http:Path {value:"/session"}
    resource sendData (message m) {
        message response = {};
        json j1 = {"firstName":"Sajitha","lastName":"Liyanage"};
        messages:setJsonPayload(response,j1);
        reply response;
    }
}