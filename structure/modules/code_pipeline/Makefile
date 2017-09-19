.PHONY: zip clean

all: clean zip

zip:
		cd scripts; zip -r code_pipeline.zip setup.cfg lambda.py unzip_package/*.py lib
		mv scripts/code_pipeline.zip .

clean:
		-$(RM) scripts/code_pipline.zip
		-$(RM) code_pipline.zip
