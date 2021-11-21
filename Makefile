__logo:
	@echo "          __                __                         "
	@echo "    _____/ /_  ____  ____  / /____  _____              "
	@echo "   / ___/ __ \/ __ \/ __ \/ __/ _ \/ ___/  __          "
	@echo "  /__  / / / / /_/ / /_/ / /_/  __/ / ____/ /__ _   __ "
	@echo " /____/_/ /_/\____/\____/\__/\___/_/ / __  / _ | | / / "
	@echo "       -*- By ShooterDev -*-        / /_/ /  __| |/ /  "
	@echo "                                    \____/\___/|___/   "
	@echo " ===================================================== "

install:
	make __logo

	pipenv install

	make prepare

prepare:
	make database

database:
	rm -f ./*/migrations/[0-9]*

	./manage.py sqlflush

	./manage.py makemigrations

	./manage.py migrate

fix:
	python -m black --line-length 120 ./

	python -m autopep8 --recursive --in-place --aggressive --max-line-length=120 ./

analyse:
	python -m flake8 --max-line-length=120 ./

	python pylint ./

	python -m pycodestyle --max-line-length=120 ./

tests:
	clear

	python3 -m pytest ./api --cov-report=html -s

	./manage.py test api --verbosity 3 --pattern="test_*.py"

run:
	make __logo

	./manage.py runserver