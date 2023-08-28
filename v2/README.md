# Mind Palace

## Development

```
python3 -m venv venv
```

followed by:
```
source venv/bin/activate
```
Install all the packages with
```
pip3 install -r requirements/dev.txt
```

When done, remember to run
```
deactivate
```

### Requirement

Run the following command once to setup the local git hooks to black formatting:

```
$ git config core.hooksPath ./git-hooks
```

