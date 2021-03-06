@quay.io/kiegroup/kogito-runtime-jvm 
@quay.io/kiegroup/kogito-data-index-infinispan @quay.io/kiegroup/kogito-data-index-mongodb 
@quay.io/kiegroup/kogito-task-console 
@quay.io/kiegroup/kogito-management-console 
@quay.io/kiegroup/kogito-explainability 
@quay.io/kiegroup/kogito-jit-runner 
@quay.io/kiegroup/kogito-jobs-service 
@quay.io/kiegroup/kogito-trusty-infinispan @quay.io/kiegroup/kogito-trusty-redis 
@rhpam-7/rhpam-kogito-runtime-jvm-rhel8
Feature: Common tests for Custom TrustStore configuration
  Scenario: Verify if a custom certificate is correctly handled
    When container is started with command /home/kogito/kogito-app-launch.sh
      | variable            | value              |
      | CUSTOM_TRUSTSTORE   | my-truststore.jks  |
      | RUNTIME_TYPE        | quarkus            |
    Then container log should contain INFO ---> Configuring custom Java Truststore 'my-truststore.jks' in the path /home/kogito/certs/custom-truststore
    Then container log should contain ERROR ---> A custom truststore was specified ('my-truststore.jks'), but wasn't found in the path /home/kogito/certs/custom-truststore
