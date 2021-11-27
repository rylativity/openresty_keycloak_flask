Steps To Start Project
1. `cd certs`
2. `chmod +x ./certs/generate_sample_certs.sh`
3. `cd ..`
4. `docker-compose up -d`
5. Create realm called "myrealm" in Keycloak through the admin console at localhost:8080/auth (have to wait for Keycloak to start; login information in docker-compose.yml)
6. Create client called "openresty" in "myrealm" realm
7. Set client to "confidential", copy client id and secret to nginx_conf/default.conf in access_by_lua script.
8. May need to modify keycloak urls in access_by_lua script.  172.17.0.1 is default docker network for Linux. Mac can use host.docker.internal.
