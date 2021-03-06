#!/bin/bash

# Script per avviare l'applicazione Sentence 

echo Running SENTENCE [Declarative REST Client and Circuit Breaker and API Gateway]

# Consul deve essere avviato separatamente 

echo Starting Word Services [subject*2 + verb*2 + object*2]
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=subject word-service/build/libs/word.jar &
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=subject word-service/build/libs/word.jar &
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=verb word-service/build/libs/word.jar &
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=verb word-service/build/libs/word.jar &
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=object word-service/build/libs/word.jar &
java -Xms64m -Xmx128m -jar -Dspring.profiles.active=object word-service/build/libs/word.jar &

echo Starting Sentence Service [*2, using Declarative REST Client and Circuit Breaker]

java -Xms64m -Xmx128m -jar sentence-service/build/libs/sentence.jar &
java -Xms64m -Xmx128m -jar sentence-service/build/libs/sentence.jar &

sleep 10

echo Starting API Gateway [*1, listening on 8080]

java -Xms64m -Xmx128m -jar api-gateway/build/libs/apigateway.jar &
