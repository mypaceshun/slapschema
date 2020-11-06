# slapschema
slapschema run in Docker

# Usage

Basic Usage

```
$ docker run -v "/your/schema/directory:/root/sceham:ro" mypaceshun/slapschema
```

Run slapschema to all schemfile in /your/schema/directory

Schemafile is matched to `"*.schema"` or `"*.ldif"`
