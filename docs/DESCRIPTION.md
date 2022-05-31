# Description

>The [UMLS](https://www.nlm.nih.gov/research/umls/index.html) integrates and distributes key terminology, classification and coding standards, and associated resources to promote creation of more effective and interoperable biomedical information systems and services, including electronic health records.

# Tables

UMLS Tables

`MRCONSO.parquet` - There is exactly one row in this file for each atom (each occurrence of each unique string or concept name within each source vocabulary) in the Metathesaurus, i.e., there is exactly one row for each unique AUI in the Metathesaurus. Every string or concept name in the Metathesaurus appears in this file, connected to its language, source vocabularies, and its concept identifier. The values of TS, STT, and ISPREF reflect the default order of precedence of vocabulary sources and term types in MRRANK.RRF. (Table 1)

fields

**CUI** - Unique identifier for concept

**LAT** - Language of term

**TS** - Term status

**LUI** - Unique identifier for term

**STT** - String type

**SUI** - Unique identifier for string

**ISPREF** - Atom status - preferred (Y) or not (N) for this string within this concept

**AUI** - Unique identifier for atom - variable length field, 8 or 9 characters

**SAUI** - Source asserted atom identifier [optional]

**SCUI** - Source asserted concept identifier [optional] *Biobricks Author Note: This corresponds to the vocabularly used, e.g. CPT, MEDCIN

**SDUI** - Source asserted descriptor identifier [optional]

**SAB** - Abbreviated source name (SAB). Maximum field length is 20 alphanumeric characters. Two source abbreviations are assigned:
Root Source Abbreviation (RSAB) — short form, no version information, for example, AI/RHEUM, 1993, has an RSAB of "AIR"
Versioned Source Abbreviation (VSAB) — includes version information, for example, AI/RHEUM, 1993, has an VSAB of "AIR93"
Official source names, RSABs, and VSABs are included on the [UMLS Source Vocabulary Documentation page](https://www.nlm.nih.gov/research/umls/sourcereleasedocs/index.html).

**TTY** - Abbreviation for term type in source vocabulary, for example PN (Metathesaurus Preferred Name) or CD (Clinical Drug). Possible values are listed on the Abbreviations Used in Data Elements page.

**CODE** - Most useful source asserted identifier (if the source vocabulary has more than one identifier), or a Metathesaurus-generated source entry identifier (if the source vocabulary has none). *biobricks author's note: This corresponds to the code for the vocabulary, e.g. the CPT code, the MEDCIN code*

**STR** -  String

**SRL** - Source restriction level

**SUPPRESS** - Suppressible flag. Values = O, E, Y, or N
O: All obsolete content, whether they are obsolesced by the source or by NLM. These will include all atoms having obsolete TTYs, and other atoms becoming obsolete that have not acquired an obsolete TTY (e.g. RxNorm SCDs no longer associated with current drugs, LNC atoms derived from obsolete LNC concepts).
E: Non-obsolete content marked suppressible by an editor. These do not have a suppressible SAB/TTY combination.
Y: Non-obsolete content deemed suppressible during inversion. These can be determined by a specific SAB/TTY combination explicitly listed in MRRANK.
N: None of the above
Default suppressibility as determined by NLM (i.e., no changes at the Suppressibility tab in MetamorphoSys) should be used by most users, but may not be suitable in some specialized applications. See the [MetamorphoSys Help](http://www.nlm.nih.gov/research/umls/implementation_resources/metamorphosys/help.html) page for information on how to change the SAB/TTY suppressibility to suit your requirements. NLM strongly recommends that users not alter editor-assigned suppressibility, and MetamorphoSys cannot be used for this purpose.

**CVF** - Content View Flag. Bit field used to flag rows included in Content View. This field is a varchar field to maximize the number of bits available for use.