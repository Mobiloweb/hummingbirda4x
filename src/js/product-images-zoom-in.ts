// @ts-nocheck
import PhotoSwipeLightbox from 'photoswipe/lightbox';
import PhotoSwipe from 'photoswipe';

import 'photoswipe/style.css';

import selectorsMap from './constants/selectors-map';

const Default = {
  initialZoom: 3,
  minZoom: 1.25,
  maxZoom: 10,
  zoomSpeed: 0.01
};

class Zoomable {
  constructor(element, config) {
    this.element = element;
    this.config = this._mergeConfig(config);

    const { initialZoom, minZoom, maxZoom } = this.config;

    this.zoomed = false;
    this.initialZoom = Math.max(Math.min(initialZoom, maxZoom), minZoom);
    this.zoom = this.initialZoom;

    this.img = element.querySelector(".zoomable__img");
    this.img.draggable = false;
    this.element.style.setProperty("--zoom", this.initialZoom);

    this._handleMouseover = this._handleMouseover.bind(this);
    this._handleMousemove = this._handleMousemove.bind(this);
    this._handleMouseout = this._handleMouseout.bind(this);
    this._handleWheel = this._handleWheel.bind(this);
    this._handleTouchstart = this._handleTouchstart.bind(this);
    this._handleTouchmove = this._handleTouchmove.bind(this);
    this._handleTouchend = this._handleTouchend.bind(this);

    this._addEventListeners();
  }

  static get Default() {
    return Default;
  }

  _addEventListeners() {
    this.element.addEventListener("mouseover", this._handleMouseover);
    this.element.addEventListener("mousemove", this._handleMousemove);
    this.element.addEventListener("mouseout", this._handleMouseout);
    this.element.addEventListener("wheel", this._handleWheel);
    this.element.addEventListener("touchstart", this._handleTouchstart);
    this.element.addEventListener("touchmove", this._handleTouchmove);
    this.element.addEventListener("touchend", this._handleTouchend);
  }

  _handleMouseover() {
    if (this.zoomed) {
      return;
    }

    this.element.classList.add("zoomable--zoomed");

    this.zoomed = true;
  }

  _handleMousemove(evt) {
    if (!this.zoomed) {
      return;
    }

    const elPos = this.element.getBoundingClientRect();

    const percentageX = `${
      ((evt.clientX - elPos.left) * 100) / elPos.width
    }%`;
    const percentageY = `${
      ((evt.clientY - elPos.top) * 100) / elPos.height
    }%`;

    this.element.style.setProperty("--zoom-pos-x", percentageX);
    this.element.style.setProperty("--zoom-pos-y", percentageY);
  }

  _handleMouseout() {
    if (!this.zoomed) {
      return;
    }

    this.element.style.setProperty("--zoom", this.initialZoom);
    this.element.classList.remove("zoomable--zoomed");

    this.zoomed = false;
  }

  _handleWheel(evt) {
    if (!this.zoomed) {
      return;
    }

    evt.preventDefault();

    const newZoom = this.zoom + evt.deltaY * (this.config.zoomSpeed * -1);
    const { minZoom, maxZoom } = this.config;

    this.zoom = Math.max(Math.min(newZoom, maxZoom), minZoom);
    this.element.style.setProperty("--zoom", this.zoom);
  }

  _handleTouchstart(evt) {
    evt.preventDefault();

    this._handleMouseover();
  }

  _handleTouchmove(evt) {
    if (!this.zoomed) {
      return;
    }

    const elPos = this.element.getBoundingClientRect();

    let percentageX =
      ((evt.touches[0].clientX - elPos.left) * 100) / elPos.width;
    let percentageY =
      ((evt.touches[0].clientY - elPos.top) * 100) / elPos.height;

    percentageX = Math.max(Math.min(percentageX, 100), 0);
    percentageY = Math.max(Math.min(percentageY, 100), 0);

    this.element.style.setProperty("--zoom-pos-x", `${percentageX}%`);
    this.element.style.setProperty("--zoom-pos-y", `${percentageY}%`);
  }

  _handleTouchend(evt) {
    this._handleMouseout();
  }

  _mergeConfig(config) {
    return {
      ...this.constructor.Default,
      ...(typeof config === "object" ? config : {})
    };
  }

  destroy() {
    this.element.removeEventListener("mouseover", this._handleMouseover);
    this.element.removeEventListener("mousemove", this._handleMousemove);
    this.element.removeEventListener("mouseout", this._handleMouseout);
    this.element.removeEventListener("wheel", this._handleWheel);
    this.element.removeEventListener("touchstart", this._handleTouchstart);
    this.element.removeEventListener("touchmove", this._handleTouchmove);
    this.element.removeEventListener("touchend", this._handleTouchend);
  }
}

export default function initProductImagesZoomIn() {
  const {prestashop, Theme: {events}} = window;

  let zoomablesInstances = [];

  function toggleZoomable() {
    zoomablesInstances.forEach(instance => instance.destroy());
    zoomablesInstances = [];

    if (window.innerWidth >= 992) {
      const zoomables = document.querySelectorAll(".zoomable");

      for (const el of zoomables) {
        zoomablesInstances.push(new Zoomable(el));
      }
    }
  }

  $(document).ready(() => {
    toggleZoomable();
    window.addEventListener('resize', () => toggleZoomable())

    new PhotoSwipeLightbox({
      gallery: '#product-images',
      children: 'a',
      pswpModule: PhotoSwipe,
      spacing: 0.12,
      bgOpacity: 0.8,
      maxSpreadZoom: 2,
      getDoubleTapZoom: (isMouseClick, item) => {
        return item.initialZoomLevel < 0.7 ? 1 : item.initialZoomLevel;
      },
      allowPanToNext: false,
      pinchToClose: false,
    }).init();
  });
}
