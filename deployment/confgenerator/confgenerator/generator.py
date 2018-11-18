"""
"""

import yaml

class Generator():
    """
    """
    def __init__(self, args, validator):
        """
        """
        self.info = args['info']
        self.conf_dest = args['dest']+"/config.env"
        self.val = validator

    def load_yaml(self, yaml_file):
        """
        """
        with open(yaml_file, 'r') as f:
            return yaml.load(f)

    def write_env(self, var_dict, dest):
        """
        """
        f = open(dest, 'a')
        for k, v in var_dict.items():
            f.write(k+'='+v+'\n')
        f.close
        
    def generate(self):
        """
        """
        info_dict = self.load_yaml(self.info)
        self.write_env(info_dict, self.conf_dest)