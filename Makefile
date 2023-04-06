PORT ?= 8000
start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) wishes_app:app
dev:
	poetry run flask --debug --app wishes_app:app run
lint:
	poetry run flake8 app