#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="$PROJECT_ROOT/springboot-app.jar"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

echo "$TIME_NOW : copy $JAR_FILE" >> $DEPLOY_LOG
cp $PROJECT_ROOT/sample-1/target/*.jar $JAR_FILE

echo "$TIME_NOW : run $JAR_FILE" >> $DEPLOY_LOG
nohup java -jar $JAR_FILE > $APP_LOG 2> $ERROR_LOG &

CURRENT_PID=$(pgrep -f $JAR_FILE)
echo "$TIME_NOW : process id is $CURRENT_PID" >> $DEPLOY_LOG 
