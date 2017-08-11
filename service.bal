import ballerina.net.http;

string CLIENT_ID = "848fabbc8f4e84ee743e";

service<http> access{


    resource auth(message m){
        message responses = {};
        http:ClientConnector location = create http:ClientConnector("https://github.com/login/oauth/authorize?scope=user:email&client_id="+CLIENT_ID+"");
        responses = http:ClientConnector.post(location,"",m);
        reply responses;
    }


    resource login(message m){
        message response = {};
        http:ClientConnector locationEP = create http:ClientConnector("http://localhost:63342/GitHub/webapp/home.html");
        response = http:ClientConnector.post(locationEP,"",m);
        reply response;
    }
}
