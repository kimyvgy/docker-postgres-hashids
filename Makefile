IMAGE ?= thphuong/postgres-hashids
TAGS ?= 10-alpine 11-alpine 12-alpine 13-alpine 14-alpine

.PHONY: alpine

alpine: $(TAGS)

$(TAGS):
	docker build . \
		-f alpine.Dockerfile \
		--build-arg TAG=$@ \
		--cache-from $(IMAGE):$@ \
		--tag $(IMAGE):$@
