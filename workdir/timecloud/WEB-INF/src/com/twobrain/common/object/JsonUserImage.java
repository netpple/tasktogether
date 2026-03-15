package com.twobrain.common.object;

/**
 * Created by Cristina on 2014-07-11.
 */
public class JsonUserImage {
    public int idx = 0;
    public int ownerIdx = 0;
    public String ownerName = "";
    public String name = "";
    public String size = "";
    public String url = "";
    public String thumbnailUrl = "";
    public String deleteUrl = "";
    public String deleteType = "";
    public String date = "";
    public int thumbnailWidth = 0;
    public int thumbnailHeight = 0;
    public String selectedYn = "N";

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public int getOwnerIdx() {
        return ownerIdx;
    }

    public void setOwnerIdx(int ownerIdx) {
        this.ownerIdx = ownerIdx;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getDeleteUrl() {
        return deleteUrl;
    }

    public void setDeleteUrl(String deleteUrl) {
        this.deleteUrl = deleteUrl;
    }

    public String getDeleteType() {
        return deleteType;
    }

    public void setDeleteType(String deleteType) {
        this.deleteType = deleteType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getThumbnailWidth() {
        return thumbnailWidth;
    }

    public void setThumbnailWidth(int thumbnailWidth) {
        this.thumbnailWidth = thumbnailWidth;
    }

    public int getThumbnailHeight() {
        return thumbnailHeight;
    }

    public void setThumbnailHeight(int thumbnailHeight) {
        this.thumbnailHeight = thumbnailHeight;
    }

    public String getSelectedYn() {
        return selectedYn;
    }

    public void setSelectedYn(String selectedYn) {
        this.selectedYn = selectedYn;
    }
}
