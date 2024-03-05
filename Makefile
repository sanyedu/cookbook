DST_DIR:=_site

.PHONY: all clean server
all:
	hugo -D -d $(DST_DIR) --baseURL https://docs.sanyedu.org/cookbook/

server:
	hugo server -D -d $(DST_DIR)

clean:
	-rm -rf $(DST_DIR)

.PHONY: sitemap sitemap-init
sitemap-init:
	cd themes/codelabs/scripts/gen-sitemap \
		&& rm -rf .venv \
		&& python -m venv .venv \
		&& source .venv/Scripts/activate \
		&& pip install -r requirements.txt
sitemap:
	mkdir -p static/recipes
	source themes/codelabs/scripts/gen-sitemap/.venv/Scripts/activate \
		&& python themes/codelabs/scripts/gen-sitemap/main.py
