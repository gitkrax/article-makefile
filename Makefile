
# Change these if needed: first is the source file, others are templates used
SOURCE = $(wildcard *.md) # try to convert any .md files in the folder
DOCXTEMPLATE = reference.docx # .docx-file used as a reference
PDFTEMPLATE = article.latex # the default latex template for articles

# Just the file name, no extension
SOURCEBASENAME = $(basename $(SOURCE))

# Assume that images are in folder 'img' and either .jpg or .png files
IMG = $(wildcard *.jpg *.png)
IMGFOLDER = $(addprefix img/, $(IMG))

pdf:	$(SOURCE) $(IMGFOLDER)
	pandoc \
	--template=$(PDFTEMPLATE) \
	--filter pandoc-citeproc \
	$< -o $(SOURCEBASENAME).pdf

docx:	$(SOURCE) $(IMGFOLDER)
	pandoc \
	--reference-docx=$(DOCXTEMPLATE) \
	--filter pandoc-citeproc \
	$< -o $(SOURCEBASENAME).docx

all:	docx pdf
