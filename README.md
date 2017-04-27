# super-simple-load-generator

# Usage

### On CF 
The script needs 4 environment variables to be set on CF - 
1. The base url for the endpoint you want to hit
```
base_url
``` 

2. The lower bound for the time interval range 
```
lower_bound
```

3. The upper bound for the time interval range
```
upper_bound
```

4. Comma separated url paths that will be appended to the base URL before making the request. 
Leave it empty if you only want to hit the base url 

```
url_paths
```

### Running locally (OSX)

Set up the environment variables and run the script. Example: 

```
export base_url="https://www.google.com/"
export url_paths="maps,jobs,flights"
export lower_bound=0
export upper_bound=0.5
ruby load_generator.rb
```

# Push to CF

```
cf push
```
