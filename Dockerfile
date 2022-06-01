FROM python:3.9.0-alpine3.12
#RUN mkdir robot
WORKDIR /robot
COPY . /robot
RUN pip install -r requirements.txt


CMD ["sh", "./scripts/system_tests.sh"]