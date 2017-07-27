create:
	nestor create-job "Brew Coffee" job_config_success_1.xml
	nestor create-job "Feed The Cat" job_config_success_2.xml
	nestor create-job "Dim Light" job_config_success_3.xml
	nestor create-job "Wash Dishes" job_config_failure_1.xml
	nestor create-job "Vacuum Living Room" job_config_failure_2.xml
	nestor create-job "Call Lady Gaga" job_config_failure_3.xml

delete:
	nestor delete-job success-1
	nestor delete-job success-2
	nestor delete-job success-3
	nestor delete-job failure-1
	nestor delete-job failure-2
	nestor delete-job failure-3

.PHONY: create delete
