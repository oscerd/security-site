#!/usr/bin/env python3

import json
import re

# from https://www.apache.org/security/projects.html
lines = [line for line in open('projects.html', 'r').readlines() if line.startswith('<td')]
pairs = zip(lines[::2], lines[1::2])

def parsePair(pair):
    leftre = re.compile('^<td>(<a href="([^"]+)">)?([^<]+).*')
    l = leftre.match(pair[0])
    name = l[3]
    link = l[2]
    linkre = re.compile('https://([^.]+)')
    pmc = ''
    if link:
        pmc = linkre.match(link)[1]
        if pmc == 'cwiki':
            match name:
                case 'Apache SpamAssassin':
                    pmc = 'spamassassin'
                case 'Apache Fineract':
                    pmc = 'fineract'
                case 'Apache Sentry':
                    pmc = 'sentry'
                case 'Apache Solr':
                    pmc = 'solr'
                case _:
                    raise Exception(name)
    else:
        match name:
            case 'Apache Ambari':
                pmc = 'ambari'
            case 'Apache CouchDB':
                pmc = 'couchdb'
            case 'Apache Ignite':
                pmc = 'ignite'
            case 'Apache Jackrabbit':
                pmc = 'jackrabbit'
            case 'Apache Logging':
                pmc = 'logging'
            case 'Apache Lucene':
                pmc = 'lucene'
            case 'Apache Metron':
                pmc = 'metron'
            case 'Apache Trafodion':
                pmc = 'trafodion'
            case 'Apache Portable Runtime (APR)':
                pmc = 'apr'
            case 'Apache Traffic Server':
                pmc = 'trafficserver'
            case _:
                raise Exception(name)
    rightre = re.compile('^<td><a href="mailto:([^"]+)')
    r = rightre.match(pair[1])

    return [
        pmc,
        {
            'name': l[3],
            'link': l[2],
            'contact': r[1]
        }
    ]

objs = { kv[0]: kv[1] for kv in map(parsePair, pairs) }

def add(pmc, name):
    assert not pmc in objs.keys()
    objs[pmc] = {
        'name': pmc,
        'link': None,
        'contact': 'security@apache.org'
    }

with open('project-coordinates.json', 'w', encoding='utf-8') as f:
    json.dump(objs, f, ensure_ascii=True, indent=2)