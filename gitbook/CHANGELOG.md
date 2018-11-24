# 0.1.7: add test interface

### Update gitbook:
1. update change log
2. add workflow doc
3. update deployement

### Update imageAPI:
1. add target 'test_config'
2. add target 'test_start'
3. add target 'test_stop'
4. add target 'test_restart'
5. add target 'test_remove'


# 0.1.3: Add confgenerator.

### Add initial confgenerator
1. unified the key with the env variable of imageAPI.
2. add default value in dns-proxy-info.yml

### Update imageAPI:
1. add iptables rules when checking status.
2. input the config.env path when config.
3. add template config.env.
4. move imageAPI related files from deployment/ to deployment/imageAPI/.

### Add gitbook:
1. add changelog document.
2. update summary document.
3. update readme document.
4. add dependency document.
5. add deployment document.
6. add topology document.
7. add conf gen document.

### Update .gitignore:
1. ignore vscode setting.
2. ignore python cache.
3. ignore confgenerator directory when build.


### Update makefile:
1. add target 'mk-confgenerator'.
2. add target 'mk-imageAPI'.
3. update target 'clean-deployment'.
