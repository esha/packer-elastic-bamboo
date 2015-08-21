VAR_FILE ?= variables.json

.PHONY: clean image

image: image.json $(VAR_FILE) cookbooks
	@packer validate -var-file=$(VAR_FILE) image.json
	@packer build -var-file=$(VAR_FILE) image.json

cookbooks:
	@berks vendor cookbooks

clean:
	@rm -rf cookbooks
