function fn() {
    var env = karate.env; 
    var config = {env: env}

    config.baseUrl = "https://bookstore.demoqa.com/"
    
    var uuid = java.util.UUID.randomUUID().toString().substring(0, 8);
    config.usuario = 'user_' + uuid;
    config.senha = 'A1!' + uuid + 'z';


    karate.log('karate.env system property was:', env);
    karate.log('karate.env system property was:', env);
    karate.configure('retry', {count: 10, interval: 5000}); 
    karate.configure('connectTimeout', 60000);
    //karate.configure('readTimeout', 60000);

    return config;
}