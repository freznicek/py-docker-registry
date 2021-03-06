test:
	python /usr/bin/nosetests --cover-package=registry --with-coverage

run-docker-registry:
	docker run -d -p 5000:5000 --name registry registry:2.5

push-some:
	docker pull busybox
	for a in {1..50}; do \
		for b in {1..50}; do \
			docker tag busybox localhost:5000/a$$a:$$b > /dev/null && \
			docker push localhost:5000/a$$a:$$b > /dev/null && \
			echo $$a $$b; \
		done; \
	done
.PHONY: test
