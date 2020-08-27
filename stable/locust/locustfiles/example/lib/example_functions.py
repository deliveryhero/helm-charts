# -*- coding: utf-8 -*-

import random


def choose_random_page():
    pages = [
        '/policies/privacy/',
        '/contact/',
        '/about/',
        '/search/howsearchworks/crawling-indexing/',
        '/search/howsearchworks/algorithms/'
    ]

    return random.choice(pages)
