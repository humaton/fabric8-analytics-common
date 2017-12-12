build:
		docker build . -t fabri8-analytics-deploy-image

bash:
		docker run -ti fabri8-analytics-deploy-image bash

build-test:
		docker build ../integration-tests/ -t fabri8-analytics-e2e-tests

test:
		docker run -t \
    		-e F8A_API_URL=${F8A_API_URL} \
    		-e F8A_JOB_API_URL=${F8A_JOB_API_URL} \
    		-e F8A_ANITYA_API_URL=${F8A_ANITYA_API_URL} \
    		-e F8A_GREMLIN_URL=${F8A_GREMLIN_URL} \
    		-e F8A_3SCALE_URL=${F8A_3SCALE_URL} \
    		-e F8A_SERVICE_ID=${F8A_SERVICE_ID} \
    		${RECOMMENDER_API_TOKEN:+-e RECOMMENDER_API_TOKEN=${RECOMMENDER_API_TOKEN}} \
    		fabri8-analytics-e2e-tests --tags=-jobs.requires_auth --no-color $@



deploy:
		docker run --rm -ti fabri8-analytics-deploy-image