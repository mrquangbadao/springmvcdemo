$.SimpleSave = {
	defaultOptions : {},
	jqueryWrapDom : function(doms) {
		if (doms) {
			if ($.isArray(doms)) {
				for (var ii = 0; ii < doms.length; ii++) {
					doms[ii] = (doms[ii] instanceof $) ? doms[ii] : $(doms[ii]);
				}
			} else {
				doms = (doms instanceof $) ? doms : $(doms);
			}
		}
		return doms;
	},
	collectData : function(uiStoreData, allDoms, excludeDoms, options) {
		for (var i = 0; i < allDoms.length; i++) {
			allDoms[i].each(function() {
				var $currCtlThis = $(this), ctlItemType = ($currCtlThis.attr('type') + "").toLowerCase(), ctlItemPushable = true;
				if ($currCtlThis.prop("tagName") !== 'INPUT' || 'hidden' !== ctlItemType) {
					if (excludeDoms) {
						if ($.isArray(excludeDoms)) {
							for (var ii = 0; ii < excludeDoms.length; ii++) {
								excludeDoms[ii].each(function() {
									if ($currCtlThis[0] == $(this)[0] || $currCtlThis.hasAncestor(this)) {
										ctlItemPushable = false;
									}
								});
							}
						} else {
							excludeDoms.each(function() {
								ctlItemPushable = ctlItemPushable && !($currCtlThis[0] == $(this)[0] || $currCtlThis.hasAncestor(this));
							});
						}
					}
					if (ctlItemPushable) {
						uiStoreData.push({
							tagId : (ctlItemType === 'file' && !options.fileTagId ? '' : $currCtlThis.attr('id')),
							tagName : $currCtlThis.prop("tagName"),
							inputType : ctlItemType,
							inputValue : ((ctlItemType === 'checkbox' || ctlItemType === 'radio') ? $currCtlThis.is(':checked') : $currCtlThis.val()),
							selectText : (($currCtlThis.prop("tagName") !== 'SELECT') ? "" : $currCtlThis.find('option:selected').text())
						});
					}
				}
			});
		}
	},
	parseOptions : function(options) {
		options = options ? options : this.defaultOptions;
		this.options = $.extend(true, {}, this.defaultOptions, options);
	},
	saveUiData : function(allDoms, excludeDoms, options) {
		var _self = this;
		this.parseOptions(options);
		allDoms = this.jqueryWrapDom(allDoms);
		excludeDoms = this.jqueryWrapDom(excludeDoms);
		setTimeout(function() {
			$.uiSimpleData = [];
			_self.collectData($.uiSimpleData, allDoms, excludeDoms, _self.options);
		}, 200);
	},
	fillBack : function() {
		console.log($.uiSimpleData);
		if ($.SimpleSave.currIdx < $.SimpleSave.allDoms.length - 1) {
			$.SimpleSave.currIdx++;
			var _self = $.SimpleSave;
			$($.SimpleSave.allDoms[$.SimpleSave.currIdx]).each(function() {
				var $currCtlThis = $(this), ctlItemType = ($currCtlThis.attr('type') + "").toLowerCase(), ctlItemPushable = true;
				if ($currCtlThis.prop("tagName") !== 'INPUT' || 'hidden' !== ctlItemType) {
					if (_self.excludeDoms) {
						if ($.isArray(_self.excludeDoms)) {
							for (var ii = 0; ii < _self.excludeDoms.length; ii++) {
								$(_self.excludeDoms[ii]).each(function() {
									if ($currCtlThis[0] == $(this)[0] || $currCtlThis.hasAncestor(this)) {
										ctlItemPushable = false;
									}
								});
							}
						} else {
							$(_self.excludeDoms).each(function() {
								ctlItemPushable = ctlItemPushable && !($currCtlThis[0] == $(this)[0] || $currCtlThis.hasAncestor(this));
							});
						}
					}
					if (ctlItemPushable) {
						var uiInputData = {
							tagId : (ctlItemType === 'file' && !options.fileTagId ? '' : $currCtlThis.attr('id')),
							tagName : $currCtlThis.prop("tagName"),
							inputType : ctlItemType,
							inputValue : ((ctlItemType === 'checkbox' || ctlItemType === 'radio') ? $currCtlThis.is(':checked') : $currCtlThis.val()),
							selectText : (($currCtlThis.prop("tagName") !== 'SELECT') ? "" : $currCtlThis.find('option:selected').text())
						};
						console.log(uiInputData);
						for (var ii = 0; ii < $.uiSimpleData.length; ii++) {
							if ($.uiSimpleData[ii].tagId == uiInputData.tagId && //
							$.uiSimpleData[ii].tagName == uiInputData.tagName && //
							$.uiSimpleData[ii].inputType == uiInputData.inputType) {
								if (uiInputData.tagName === 'INPUT') {
									if (uiInputData.inputType === 'checkbox' || uiInputData.inputType === 'radio') {
										if ($currCtlThis.prop('checked') != $.uiSimpleData[ii].inputValue) {
											$currCtlThis.prop('checked', $.uiSimpleData[ii].inputValue);
											if ($.uiSimpleData[ii].inputValue) {
												$currCtlThis.click();
											}
										}
									} else {
										console.log($.uiSimpleData[ii].inputValue);
										$currCtlThis.val($.uiSimpleData[ii].inputValue);
									}
									$currCtlThis.change();
									$currCtlThis.keyup();
								} else if (uiInputData.tagName === 'SELECT') {
									$currCtlThis.val($.uiSimpleData[ii].inputValue);
									$currCtlThis.change();
									$currCtlThis.keyup();
								} else {
									$currCtlThis.val($.uiSimpleData[ii].inputValue);
									$currCtlThis.change();
									$currCtlThis.keyup();
								}
								break;
							}
						}
					}
				}
			});
			setTimeout($.SimpleSave.fillBack, 120);
		}
	},
	fillDataBack : function(allDoms, excludeDoms, options) {
		this.parseOptions(options);
		this.allDoms = allDoms;
		this.excludeDoms = excludeDoms;
		this.currIdx = -1;
		setTimeout(this.fillBack, 100);
	}
};