# Azure Blob Storage Overview

Azure Blob Storage is Microsoft's object storage solution for the cloud. It is optimized for storing massive amounts of unstructured data.

## Unstructured Data
Unlike relational databases (SQL) or NoSQL document stores (JSON), Blob Storage has no concept of internal schemas. A blob is simply a stream of bytes. It can be a text file, binary data, a video, a VHD, or a backup archive.

## Data Organization
- **Storage Account:** The top-level namespace.
- **Containers:** Similar to folders or directories. They group sets of blobs.
- **Blobs:** The files themselves.

## Metadata vs. Index Tags
You can attach context to unstructured data to make it searchable and manageable.

1. **Metadata:** Key-value pairs provided as HTTP headers. They are retrieved when you request the blob's properties, but you cannot efficiently run server-side query filters on them (you have to download the metadata for all blobs and filter client-side).
2. **Blob Index Tags:** A native Azure feature that indexes key-value pairs, allowing the Azure backend to filter and return only matching blobs (e.g., `?comp=blobs&where=category='marketing'`).

## Storage Tiers
To manage costs, Blob Storage offers different access tiers:
1. **Hot:** For data accessed frequently (highest storage cost, lowest access cost).
2. **Cool:** For data accessed infrequently, stored for at least 30 days (lower storage cost, higher access cost).
3. **Cold:** For data stored for at least 90 days.
4. **Archive:** For rarely accessed data, stored for at least 180 days. Data is taken offline and takes hours to "rehydrate" (lowest storage cost, highest access cost).

**Lifecycle Management** allows you to automate moving blobs between these tiers based on rules (e.g., age of the blob, last accessed date).
