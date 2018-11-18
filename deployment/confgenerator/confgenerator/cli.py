"""
"""

import argparse
import confgenerator.generator as GEN
import confgenerator.validator as VAL


class Dns_proxy_cli():
    """
    """
    def __init__(self, generator, validator):
        """
        """
        self.gen = generator
        self.val = validator
        self._define_parser()

    def _define_parser(self):
        """
        """
        parser = argparse.ArgumentParser()
        parser.add_argument('-f', dest='info', help="")
        parser.add_argument('-d', dest='dest', help="")

        self.parser = parser

    def generate(self):
        """
        """
        args = vars(self.parser.parse_args())
        generator = self.gen.Generator(args, self.val)
        generator.generate()

if __name__ == "__main__":
    CLI = Dns_proxy_cli(GEN, VAL)
    CLI.generate()