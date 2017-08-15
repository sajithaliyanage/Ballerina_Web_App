package gitService;
import ballerina.net.http;
import ballerina.lang.system;

string CLIENT_ID = "Iv1.f48e90ef634dda1c";

@http:configuration {basePath:"/github"}
service<http> access {

    @http:Path {value:"/login"}
    resource auth (message m) {
        message responses = {};
        http:ClientConnector location = create http:ClientConnector("https://github.com/login/oauth/authorize?scope=user:email&client_id=" + CLIENT_ID + "");
        responses = http:ClientConnector.get(location, "", m);
        reply responses;
    }

    @http:Path {value:"/home"}
    resource redirect(message m) {
        message responses = {};
        http:ClientConnector location = create http:ClientConnector("http://localhost:9763/webapp/controller/main.jag");
        responses = http:ClientConnector.get(location, "", m);
        reply responses;
    }

    @http:Path {value:"/repos"}
    resource loadRepo(message m,@http:PathParam {value:"language"}string repoName,@http:PathParam {value:"repoName"}string languageType) {
        system:println("Repo-"+repoName);
        system:println("Lang-"+languageType);
        message responses = {};
        http:ClientConnector location = create http:ClientConnector("https://api.github.com");
        responses = http:ClientConnector.get(location, "/search/repositories?q="+repoName+"+language:"+languageType+"&sort=stars&order=desc", m);
        reply responses;
    }

}
