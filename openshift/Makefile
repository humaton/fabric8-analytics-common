build:
		docker build . -t fabri8-analytics-deploy-image

bash:
		docker run -ti fabri8-analytics-deploy-image bash

build-test:
		docker build ../integration-tests/ -t fabri8-analytics-e2e-tests

test:
		bash run-e2e-test.sh

deploy:
		docker run --rm -ti fabri8-analytics-deploy-image