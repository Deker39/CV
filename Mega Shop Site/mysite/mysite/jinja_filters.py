from django import template
import re

register = template.Library()


@register.filter
def regex_match(text, pattern):
    return re.match(pattern, text) is not None

