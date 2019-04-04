# Builder image
FROM maven:3.6 as builder

RUN mkdir /app
WORKDIR /app

COPY . .
RUN mvn package -DoutputDirectory=./target

# Final image
FROM confluentinc/cp-kafka-connect:5.1.2

# Add the connector
COPY --from=builder /app/target/*.jar /etc/kafka-connect/jars/

# Add additional resources
ADD additional_resources/* /etc/additional_resources/
