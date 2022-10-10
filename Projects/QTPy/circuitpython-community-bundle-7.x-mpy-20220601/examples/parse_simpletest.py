import parse

url = "https://docs.microsoft.com/Learn"

scheme, netloc, path, params, query, fragment = parse.urlparse(url)

print("Scheme", scheme)
print("Netloc", netloc)
print("Path", path)
print("Params", params)
print("Query", query)
print("Fragment", fragment)
