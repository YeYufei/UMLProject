Ext.BLANK_IMAGE_URL = './comm/extjs/resources/images/default/s.gif';
Ext.MAX_SEARCH_NUM = 1000;
// 隔行变色
if (Ext.grid.GridPanel) {
	Ext.apply(Ext.grid.GridPanel.prototype, {
		stripeRows : true
	});
}

// 标题与内容间隔
if (Ext.layout.FormLayout) {
	Ext.apply(Ext.layout.FormLayout.prototype, {
		labelSeparator : '：'
	});
}

// label对齐方式
if (Ext.FormPanel) {
	Ext.apply(Ext.FormPanel.prototype, {
		labelAlign : 'right'
	});
}


Ext.onReady(function() {
	// 显示提示信息
		Ext.QuickTips.init();

	});

// 显示操作信息
Ext.display = function() {
	var msgCt;

	function createBox(t, s) {
		return [
				'<div class="msg">',
				'<div class="x-box-tl"><div class="x-box-tr"><div class="x-box-tc"></div></div></div>',
				'<div class="x-box-ml"><div class="x-box-mr"><div class="x-box-mc"><h3>',
				t,
				'</h3>',
				s,
				'</div></div></div>',
				'<div class="x-box-bl"><div class="x-box-br"><div class="x-box-bc"></div></div></div>',
				'</div>' ].join('');
	}
	return {
		msg : function(title, format) {
			if (!msgCt) {
				msgCt = Ext.DomHelper.insertFirst(document.body, {
					id : 'msg-div'
				}, true);
			}
			msgCt.alignTo(document, 't-t');
			var s = String.format.apply(String, Array.prototype.slice.call(
					arguments, 1));
			var m = Ext.DomHelper.append(msgCt, {
				html : createBox(title, s)
			}, true);
			m.slideIn('t').pause(1).ghost("t", {
				remove : true
			});
		},

		init : function() {
			var t = Ext.get('exttheme');
			if (!t) { // run locally?
			return;
		}
		var theme = Cookies.get('exttheme') || 'aero';
		if (theme) {
			t.dom.value = theme;
			Ext.getBody().addClass('x-' + theme);
		}
		t.on('change', function() {
			Cookies.set('exttheme', t.getValue());
			setTimeout(function() {
				window.location.reload();
			}, 15000);
		});

		var lb = Ext.get('lib-bar');
		if (lb) {
			lb.show();
		}
	}
	};
}();


/**
 * 提示
 */
if (Ext.form.BasicForm) {
	Ext.apply(Ext.form.BasicForm.prototype, {
		waitTitle : '提示'
	});
}
/** ************************bbs封装控件******************* */
bbs = {
	version : 1.0
};
Ext.ns('bbs');

/**
 * addTab
 */
bbs.addTab = function(opts) {
	parent.addNewTab(opts.title, opts.url, opts.refresh);
};

bbs.closeTab = function(opts){
    parent.removeTab(opts.title);
};

/**
 * TextField
 */
bbs.TextField = function(opts) {
	if (opts.allowBlank == false) {
		opts.fieldLabel = '<font color=red>*</font>' + opts.fieldLabel;
	}
	bbs.TextField.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.TextField, Ext.form.TextField, {});
Ext.reg('bbstextfield', bbs.TextField);

/**
 * ComboBox
 */
bbs.ComboBox = function(opts) {
	if (opts.allowBlank == false) {
		opts.fieldLabel = '<font color=red>*</font>' + opts.fieldLabel;
	}
	opts = Ext.apply( {
		valueField : 'code',
		displayField : 'name'
	}, opts);
	bbs.ComboBox.superclass.constructor.call(this, opts);
};
Ext.extend(
				bbs.ComboBox,
				Ext.form.ComboBox,
				{
					initComponent : function() {
						if (!this.tpl) {
							this.tpl = '<tpl for="."><div class="x-combo-list-item" style="height:20px;">{' + this.displayField + '}</div></tpl>';
						}
						bbs.ComboBox.superclass.initComponent.call(this);
					},
					setValue : function(v) {
						// 如果远程数据还没有加载,在设值之前先加载一次
					if (this.mode == 'remote' && this.store.getCount() == 0) {
						this.store.on("load", function() {
							bbs.ComboBox.superclass.setValue.call(this, v);
						}, this);
						this.doQuery(this.allQuery, true);
					} else {
						bbs.ComboBox.superclass.setValue.call(this, v);
					}
				},
				getCode : function() {
					var select_value = this.getRawValue();
					var store = this.store;
					var count = store.getTotalCount();
					for ( var i = 0; i < count; i++) {
						var record = store.getAt(i);
						var codeT = record.get("code");
						var nameT = record.get("name");
						if (select_value == nameT) {
							return codeT;
						}
					}
				}
				});


/**
 * 基础数据ComboBox
 * 
 * @class bbs.BaseDataComboBox
 * @extends bbs.ComboBox
 */
bbs.BaseDataComboBox = Ext.extend(bbs.ComboBox, {
	/**
	 * 基础数据
	 * 
	 * @type Array
	 */
	baseData : []
	/**
	 * 有无空行
	 * 
	 * @type Boolean
	 */
	,
	addBlank : false,
	mode : 'local',
	triggerAction : 'all',
	initComponent : function() {
		bbs.BaseDataComboBox.superclass.initComponent.call(this);
		if (!this.store) {

			this.store = new Ext.data.SimpleStore( {
				fields : [ 'code', 'name' ],
				data : this.baseData
			});
			if (this.addBlank)
				this.store.insert(0, new Ext.data.Record( [ '', '' ]));
		}
	}
});

/**
 * getLCmbNmByCd
 * 
 * 根据Value，取得LocalComboBox的DisplayText
 */
bbs.getLCmbNmByCd = function(cmbData, code) {
	try {
		for ( var i = 0; i < cmbData.length; i++) {
			if (cmbData[i][0] == code)
				return cmbData[i][1];
		}
	} catch (err) {
		return '';
	}
};

/**
 * bbs.request
 */
bbs.request = function(opts) {
	Ext.Ajax.request( {
		url : opts.url,
		success : function(response, options) {
			if (opts.success)
				opts.success.call(this, response, options);
		},
		failure : function(response, options) {
			if (opts.failure)
				opts.failure.call(this, response, options);
		},
		params : opts.params
	});
};

/**
 * JsonCmbStore
 */
bbs.JsonCmbStore = function(opts) {
	if (Ext.isEmpty(opts.addBlank))
		opts.addBlank = false;
	var opts = Ext.apply( {
		url : 'comm-cmb.action?temptime='+ (new Date().getTime().toString(36)),
		fields : [ 'code', 'name' ],
		baseParams : {
			'type' : opts.type,
			'addBlank' : opts.addBlank,
			'other' : opts.other
		}
	}, opts);
	if (opts.params)
		opts.baseParams.params = opts.params;
	bbs.JsonCmbStore.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.JsonCmbStore, Ext.data.JsonStore, {});

/**
 * NumberField
 */
bbs.NumberField = function(opts) {
	if (opts.allowBlank == false) {
		opts.fieldLabel = '<font color=red>*</font>' + opts.fieldLabel;
	}
	// var opts = Ext.apply({
	// },opts);
	bbs.NumberField.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.NumberField, Ext.form.NumberField, {});
Ext.reg('bbsnumberfield', bbs.NumberField);

/**
 * JsonStore
 */
bbs.JsonStore = function(opts) {
	var opts = Ext.apply( {
		root : 'items',
		listeners: {
            'load': function() {
				if (this.getTotalCount() > Ext.MAX_SEARCH_NUM) {
					this.removeAll();
					Ext.Msg.show({
					   title:'警告',
					   msg: '检索件数超过最大值！',
					   width:160,
					   buttons: Ext.Msg.OK
					});
				}
            }
          },
		totalProperty : 'totalCount'
	}, opts);
	bbs.JsonStore.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.JsonStore, Ext.data.JsonStore, {});

bbs.JsonNoPgStore = function(opts) {
	var opts = Ext.apply( {
		listeners: {
            'load': function() {
				if (this.getTotalCount() > Ext.MAX_SEARCH_NUM) {
					this.removeAll();
					Ext.Msg.show({
					   title:'警告',
					   msg: '检索件数超过最大值！',
					   width:160,
					   buttons: Ext.Msg.OK
					});
				}
            }
          }
	}, opts);
	bbs.JsonNoPgStore.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.JsonNoPgStore, Ext.data.JsonStore, {});

/**
 * PagingToolbar
 */
bbs.PagingToolbar = function(opts) {
	var opts = Ext.apply( {
		pageSize : pageSize,
		displayInfo : true,
		listeners : {
			loadexception : function(s, o, response, error) {
				var result = Ext.decode(response.responseText);
				bbs.ErrorAlert(result.msg);
			}
		}
	}, opts);
	bbs.PagingToolbar.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.PagingToolbar, Ext.PagingToolbar, {
	// new public method, set the page size
	setPageSize : function(size) {
		size = !size ? 1 : eval(size);// deal with string/null/undefined input
		if (typeof size == 'number') {
			if (size < 1)
				size = 1;
			// this.sizefield.dom.value = size;
			if (size != this.pageSize) {
				this.pageSize = size;
				this.doLoad(0);
			}
		} else
			throw new SyntaxError('Invalid type for size parameter');
	},
	// new public method, retrieve the total number of pages
	getPageTotalCount : function() {
		var t = this.store.getTotalCount();
		return t < this.pageSize ? 1 : Math.ceil(t / this.pageSize);
	},
	// new public method, get the current page number
	getCurrentPage : function() {
		return Math.ceil((this.cursor + this.pageSize) / this.pageSize);
	},
	showAllButton : '',
	showPageButton : '',
	onRender : function(ct, position) {
		Ext.PagingToolbar.superclass.onRender.call(this, ct, position);
		this.showAllButton = this.addButton( {
			tooltip : '全显',
			iconCls : "",
			disabled : true,
			text : '全显',
			handler : this.onClick.createDelegate(this, [ "showall" ])
		});
		this.showPageButton = this.addButton( {
			tooltip : '分页显示',
			iconCls : "",
			disabled : true,
			text : '分页显示',
			handler : this.onClick.createDelegate(this, [ "showpage" ])
		});
		this.addSeparator();
		this.addSpacer();

		this.first = this.addButton( {
			tooltip : this.firstText,
			iconCls : "x-tbar-page-first",
			disabled : true,
			handler : this.onClick.createDelegate(this, [ "first" ])
		});
		this.prev = this.addButton( {
			tooltip : this.prevText,
			iconCls : "x-tbar-page-prev",
			disabled : true,
			handler : this.onClick.createDelegate(this, [ "prev" ])
		});
		this.addSeparator();
		this.add(this.beforePageText);
		this.field = Ext.get(this.addDom( {
			tag : "input",
			type : "text",
			size : "3",
			value : "1",
			cls : "x-tbar-page-number"
		}).el);
		this.field.on("keydown", this.onPagingKeydown, this);
		this.field.on("focus", function() {
			this.dom.select();
		});
		this.field.on("blur", this.onPagingBlur, this);
		this.afterTextEl = this.addText(String.format(this.afterPageText, 1));
		this.field.setHeight(18);
		this.addSeparator();
		this.next = this.addButton( {
			tooltip : this.nextText,
			iconCls : "x-tbar-page-next",
			disabled : true,
			handler : this.onClick.createDelegate(this, [ "next" ])
		});
		this.last = this.addButton( {
			tooltip : this.lastText,
			iconCls : "x-tbar-page-last",
			disabled : true,
			handler : this.onClick.createDelegate(this, [ "last" ])
		});
		this.addSeparator();
		this.loading = this.addButton( {
			tooltip : this.refreshText,
			iconCls : "x-tbar-loading",
			handler : this.onClick.createDelegate(this, [ "refresh" ])
		});
		if (this.displayInfo) {
			this.displayEl = Ext.fly(this.el.dom).createChild( {
				cls : 'x-paging-info'
			});
		}
		if (this.dsLoaded) {
			this.onLoad.apply(this, this.dsLoaded);
		}
	},
	// override private method
	onClick : function(which) {
		var store = this.store;
		switch (which) {
		case "first":
			this.doLoad(0);
			break;
		case "prev":
			this.doLoad(Math.max(0, this.cursor - this.pageSize));
			break;
		case "next":
			this.doLoad(this.cursor + this.pageSize);
			break;
		case "last":
			var total = store.getTotalCount();
			var extra = total % this.pageSize;
			var lastStart = extra ? (total - extra) : total - this.pageSize;
			this.doLoad(lastStart);
			break;
		case "refresh":
			this.doLoad(this.cursor);
			break;
		case "showall":
			this.doLoad(this.cursor);
			this.showAllButton.setDisabled(true);
			this.showPageButton.setDisabled(false);
			this.setPageSize(this.store.getTotalCount());
			break;
		case "showpage":
			this.doLoad(this.cursor);
			this.showAllButton.setDisabled(false);
			this.showPageButton.setDisabled(true);
			this.setPageSize(25);
			break;
		}
	},

	// new private method
	onPageSizeBlur : function(e) {
		this.setPageSize(this.sizefield.dom.value);
	},

	// override private method
	onLoad : function(store, r, o) {
		if (!this.rendered) {
			this.dsLoaded = [ store, r, o ];
			return;
		}
		this.cursor = o.params ? o.params[this.paramNames.start] : 0;
		var d = this.getPageData(), ap = d.activePage, ps = d.pages;

		this.afterTextEl.el.innerHTML = String.format(this.afterPageText,
				d.pages);
		this.field.dom.value = ap;
		this.first.setDisabled(ap == 1);
		this.prev.setDisabled(ap == 1);
		this.next.setDisabled(ap == ps);
		this.last.setDisabled(ap == ps);
		this.showAllButton.setDisabled(ps == 1);
		this.showPageButton.setDisabled(!this.showAllButton.disabled);
		this.showAllButton.setDisabled(!this.showPageButton.disabled);
		this.loading.enable();
		this.updateInfo();
	}
});

/**
 * Toolbar
 */
bbs.Toolbar = function(opts) {
	var tools = new Array();
	// 新增
	if (!Ext.isEmpty(opts.add))
		tools.push( {
			text : '新增',
			iconCls : 'add',
			handler : opts.add
		});
	// 解锁
	if (!Ext.isEmpty(opts.unlock))
		tools.push( {
			text : '解锁',
			iconCls : 'unlock',
			handler : opts.unlock
		});
	// 保存
	if (!Ext.isEmpty(opts.save))
		tools.push( {
			text : '保存',
			iconCls : 'save',
			handler : opts.save
		});
	// 冻结
	if (!Ext.isEmpty(opts.dongjie))
		tools.push( {
			text : '冻结',
			iconCls : 'dongjie',
			handler : opts.dongjie
		});
	// 审核
	if (!Ext.isEmpty(opts.judge))
		tools.push( {
			text : '审核',
			iconCls : 'drop-yes',
			handler : opts.judge
		});
	// 批准
	if (!Ext.isEmpty(opts.pass))
		tools.push( {
			text : '批准',
			iconCls : 'drop-yes',
			handler : opts.pass
		});
	// 退回
	if (!Ext.isEmpty(opts.refuse))
		tools.push( {
			text : '退回',
			iconCls : 'drop-no',
			handler : opts.refuse
		});
	// 导出
	if (!Ext.isEmpty(opts.exportXls))
		tools.push( {
			text : '导出',
			iconCls : 'excel',
			handler : opts.exportXls
		});

	bbs.Toolbar.superclass.constructor.call(this, {
		items : tools
	});
};
Ext.extend(bbs.Toolbar, Ext.Toolbar, {});

/**
 * Window
 */
bbs.Window = function(opts) {
	var opts = Ext.apply( {
		resizable : false,
		shadow : true,
		layout : 'fit',
		bodyStyle : 'padding:5px;',
		closeAction : 'hide',
		modal : true,
		plain : true
	}, opts);
	bbs.Window.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.Window, Ext.Window, {});

/**
 * FormPanel
 */
bbs.FormPanel = function(opts) {
	var opts = Ext.apply( {
		frame : true,
		border : false
	}, opts);
	if (Ext.isEmpty(opts.title)) {
		switch (opts.iconCls) {
		case 'titQuery':
			opts.title = "查询条件";
			break;
		case 'titList':
			break;
		case 'titEntry':
			opts.title = "录入内容";
			break;
		default:
			break;
		}
	}
	bbs.FormPanel.superclass.constructor.call(this, opts);
};

Ext.extend(bbs.FormPanel, Ext.FormPanel, {
	load : function(options) {
		options = Ext.apply( {
			waitMsg : '正在加载数据，请稍后...'
		}, options);
		this.form.load(options);
	},
	submit : function(options) {
		if (this.form.isValid()) {
			Ext.MessageBox.confirm("提示", "您确定要保存画面信息吗？", function(btnId) {
				if (btnId == 'yes') {
					opts = Ext.apply( {
						waitMsg : '数据保存中...'
					}, options);
					opts.success = function(form, action, o) {
						if (options.success) {
							options.success.call(this, form, action, o);
						}
						bbs.TipShow( {
							type : 'info',
							text : '信息已被保存。'
						});
					};
					opts.failure = function(form, action, o) {
						bbs.ErrorAlert(
								Ext.isEmpty(action.result.msg) ? "信息保存失败。"
										: action.result.msg, function() {
									if (options.failure) {
										options.failure.call(this, form,
												action, o);
									}
								});
					};
					this.form.submit(opts);
				}
			}, this);
		}
	}
});

/*
 * 控件的隐藏和显示
 */
function hideField(field)
{
	field.disable();// for validation
	field.hide();
	field.getEl().up('.x-form-item').setDisplayed(false); // hide label
}

function showField(field)
{
	field.enable();
	field.show();
	field.getEl().up('.x-form-item').setDisplayed(true);// show label
}

/**
 * 弹出信息(alert)
 */
bbs.MsgAlert = function(opts) {
	var opts = Ext.apply( {
		title : "提示",
		width:250,
		buttons : Ext.MessageBox.OK,
		icon : Ext.MessageBox.INFO
	}, opts);
	Ext.MessageBox.show(opts);
};
bbs.InfoAlert = function(msg, fn) {
	bbs.MsgAlert( {
		msg : msg,
		fn : fn,
		icon : Ext.MessageBox.INFO
	});
};
bbs.WarnAlert = function(msg, fn) {
	bbs.MsgAlert( {
		msg : msg,
		fn : fn,
		icon : Ext.MessageBox.WARNING,
		title : '警告'
	});
};
bbs.ErrorAlert = function(msg,fn) {
	bbs.MsgAlert({msg:msg,fn:fn,icon:Ext.MessageBox.ERROR,title:'错误',minWidth:220});	
};

/**
 * TipShow
 */
createMsgDiv = function() {
	var content = '<div id="messageDiv" style="display:none;z-index:1;background-color:#01DF01;font-weight: bold;top:0;left:0;position:absolute;width:300px;height:30px;align:center;" onclick="this.style.display=\'none\'">恭喜，操作成功！</div>';
	Ext.DomHelper.append(Ext.DomQuery.selectNode('body'), {
		html : content
	});
};

bbs.TipShow = function(config) {
	if (document.getElementById('messageDiv') == undefined)
		createMsgDiv();
	// 取得信息种类
	var type = "";
	if (config.type == 'info')
		type = "信息<br/>";
	if (config.type == 'warn')
		type = "警告<br/>";
	if (config.type == 'error')
		type = "错误<br/>";
	// 取得信息内容
	var text = "";
	if (!Ext.isEmpty(config.id))
		text = config.id;
	else if (!Ext.isEmpty(config.text))
		text = config.text;

	document.getElementById('messageDiv').innerHTML = type + config.text;
	// document.getElementById('messageDiv').style.display = 'block';
	Ext.get('messageDiv').slideIn("t", {
		easing : 'easeIn',
		duration : 1.5
	});

	var timer = "";
	var hide = function() {
		Ext.get('messageDiv').slideOut("t", {
			easing : 'easeOut',
			duration : 2.5,
			remove : false,
			useDisplay : true
		});
		clearTimeout(timer);
	};

	if (config.type == 'info' || config.type == 'warn') {
		timer = setTimeout(hide, 5000);
	} else {
		timer = setTimeout(hide, 15000);
	}
};

/**
 * GridPanel
 */
bbs.GridPanel = function(opts) {
	var opts = Ext.apply( {
		labelWidth : 80,
		loadMask : true,
		enableColumnHide : false,
		enableColumnMove : false
	}, opts);
	bbs.GridPanel.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.GridPanel, Ext.grid.GridPanel, {});

/**
 * RowNumberer
 */
bbs.RowNumberer = function(opts) {
	var opts = Ext.apply( {
		header : "No.",
		width : 27
	}, opts);
	bbs.RowNumberer.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.RowNumberer, Ext.grid.RowNumberer, {});

/**
 * LabelField
 */
bbs.LabelField = Ext.extend(Ext.form.Field,
{
    format : "Y-m-d",
    altFormats : "Y-m-dTH:i:s",
    type:'',
	defaultAutoCreate : {
		tag : "span",
		style : "line-height:1.8em;"
	},
	isHtml : false,
	initComponent : function() {
		Ext.form.TextField.superclass.initComponent.call(this);
	},

	// private
	initEvents : function() {
		Ext.form.TextField.superclass.initEvents.call(this);
	},

	processValue : function(value) {
		if (this.stripCharsRe) {
			var newValue = value.replace(this.stripCharsRe, '');
			if (newValue !== value) {
				this.setRawValue(newValue);
				return newValue;
			}
		}
		return value;
	},

	filterValidation : function(e) {
		if (!e.isNavKeyPress()) {
			this.validationTask.delay(this.validationDelay);
		}
	},

	reset : function() {
		Ext.form.TextField.superclass.reset.call(this);
		this.applyEmptyText();
	},

	applyEmptyText : function() {
		if (this.rendered && this.emptyText
				&& this.getRawValue().length < 1 && !this.hasFocus) {
			this.setRawValue(this.emptyText);
			this.el.addClass(this.emptyClass);
		}
	},

	setValue : function(v){
    	if(this.rendered){
    		if(this.type=="Date" || this.type=="DateTime") v =this.formatDate(Date.parseDate(v, this.altFormats));
        	if(Ext.isGecko)
               this.el.dom.textContent = (v === null || v === undefined ? '' : v);
            else
               this.el.dom.innerText = (v === null || v === undefined ? '' : v);
        }
    	//if(this.emptyText && this.el && !Ext.isEmpty(v)){
          //  this.el.removeClass(this.emptyClass);
        //}
        //Ext.form.TextField.superclass.setValue.apply(this, arguments);
        //this.applyEmptyText();
    },
	getValue : function() {
		if (this.rendered) {
			if (Ext.isGecko)
				return this.el.dom.textContent;
			else
				return this.el.dom.innerText;
		}
	},
	selectText : function(start, end) {
	},
	 
    formatDate : function(date){
    	var f = this.type=="Date"?this.format:"Y-m-d H:i:s";
        return Ext.isDate(date) ? date.dateFormat(f) : date;
    }
});
Ext.reg('labelfield', bbs.LabelField);

/**
 * DateField
 */
bbs.DateField = function(opts) {
	if (opts.allowBlank == false) {
		opts.fieldLabel = '<font color=red>*</font>' + opts.fieldLabel;
	}
	var opts = Ext.apply( {
		format : 'Y-m-d'
	}, opts);
	bbs.DateField.superclass.constructor.call(this, opts);
};
Ext.extend(bbs.DateField, Ext.form.DateField, {});
Ext.reg('bbsdatefield', bbs.DateField);

/**
 * DateColumn
 */
bbs.DateColumn = function(opts) {
	return Ext.apply(opts, {
		type : "date",
		renderer : new Ext.util.Format.dateRenderer("Y-m-d")
	});
};

/**
 * LCmbColumn
 */
bbs.LCmbColumn = function(opts) {
	var lcmbRenderer = function(data) {
		return function(v) {
			return bbs.getLCmbNmByCd(data, v);
		};
	};
	return Ext.apply(opts, {
		renderer : new lcmbRenderer(opts.cmbData)
	});
};

bbs.StoreDateField = function(opts) {
	var options = {};
	if (typeof opts == 'string')
		options.name = opts;
	else
		options = opts;
	return Ext.apply(options, {
		type : 'date',
		dateFormat : "Y-m-dTH:i:s"
	});
};
/**
 * FromToDateField
 */
bbs.FromToDateField = Ext.extend(Ext.form.Field, {
	/**
	 * @cfg {String} FromDateformat 开始时间的格式
	 */
	fromDateformat : "Y-m-d",
	/**
	 * @cfg {String} fromDateId 开始日期控件的id属性
	 */
	fromDateId : "",
	/**
	 * @cfg {String} fromDateName 开始日期控件的name属性
	 */
	fromDateName : "",

	/**
	 * {Element} fromDateEl 开始时间控件
	 */

	/**
	 * @cfg {String} toDateformat 结束时间的格式
	 */
	toDateformat : "Y-m-d",
	/**
	 * @cfg {String} toDateId 开始日期控件的id属性
	 */
	toDateId : "",
	/**
	 * @cfg {String} toDateName 开始日期控件的name属性
	 */
	toDateName : "",
	/**
	 * {Element} toDateEl 结束时间控件
	 */

	/**
	 * @cfg {boolean} toDateVisble 是否显示结束时间
	 */
	toDateVisble : true,

	// private
	defaultAutoCreate : {
		tag : "div",
		style:"padding-left:3px!important",
		autocomplete : "off"
	},
	// private
	onRender : function(ct, position) {
		bbs.FromToDateField.superclass.onRender.call(this, ct, position);
		var fromDateId = this.fromDateId || this.getId();
		var toDateId = this.toDateId || this.getId();

		this.fromDateEl = new Ext.form.DateField( {
			id : this.fromDateId,
			name : this.fromDateName || this.fromDateId,
			hiddenLabel : true,
			format : this.fromDateformat || 'Y-m-d',
			anchor : '99%',
			endDateField : toDateId,
			vtype : 'daterange'
		});

		if (Ext.isIE6 || Ext.isIE7) {
			this.fromDateEl.render(this.el);
			Ext.fly(this.fromDateEl.el.dom.parentNode).addClass("x-column");
		} else {
			this.fromDateEl.render(Ext.DomHelper.append(this.el, {
				tag : 'div',
				cls : 'x-column'
			}, true));
		}

		if (this.toDateVisble) {
			this.el.createChild( {
				tag : 'div',
				html : '~',
				cls : 'x-column'
			});

			this.toDateEl = new Ext.form.DateField( {
				id : this.toDateId,
				name : this.toDateName || this.toDateId,
				hiddenLabel : true,
				format : this.fromDateformat || 'Y-m-d',
				anchor : '99%'
			});
			if (Ext.isIE6 || Ext.isIE7) {
				this.toDateEl.render(this.el);
			} else {
				this.toDateEl.render(Ext.DomHelper.append(this.el, {
					tag : 'div',
					cls : 'x-column'
				}, true));
			}

		} else {
			this.toDateEl = null;
		}
		Ext.DomHelper.append(this.el, {
			tag : 'div',
			cls : 'x-clear'
		});
	},
	reset : function() {
		this.fromDateEl.reset();
		this.toDateEl.reset();
	}
});
Ext.reg('fromtodatefield', bbs.FromToDateField);

/**
 * TabCloseMenu
 */
bbs.TabCloseMenu = function() {
	var tabs, menu, ctxItem;
	this.init = function(tp) {
		tabs = tp;
		tabs.on('contextmenu', onContextMenu);
	};
	function onContextMenu(ts, item, e) {
		if (!menu) { // create context menu on first right click
			menu = new Ext.menu.Menu( [ {
				id : tabs.id + '-close',
				text : '关闭选项卡',
				handler : function() {
					tabs.remove(ctxItem);
				}
			}, {
				id : tabs.id + '-close-others',
				text : '关闭其他项卡',
				handler : function() {
					tabs.items.each(function(item) {
						if (item.closable && item != ctxItem) {
							tabs.remove(item);
						}
					});
				}
			} ]);
		}
		ctxItem = item;
		var items = menu.items;
		items.get(tabs.id + '-close').setDisabled(!item.closable);
		var disableOthers = true;

		tabs.items.each(function() {
			if (this != item && this.closable) {
				disableOthers = false;
				return false;
			}
		});
		items.get(tabs.id + '-close-others').setDisabled(disableOthers);
		menu.showAt(e.getPoint());
	}
};

bbs.RowActions = function(config) {
	Ext.apply(this, config);
	// call parent
	bbs.RowActions.superclass.constructor.call(this);
};


bbs.RowDelete = function(opts) {
	Ext.MessageBox.confirm("提示", "您确定要删除该行信息吗？", function(btnId) {
		if (btnId != 'yes')
			return;
		Ext.Ajax.request( {
			url : opts.url,
			success : function(response, options) {
				if (opts.success)
					opts.success.call(this, response, options);
				bbs.TipShow( {
					type : 'info',
					text : '信息已被删除。'
				});
			},
			failure : function(response, options) {
				bbs.ErrorAlert("信息删除失败。", function() {
					if (opts.failure)
						opts.failure.call(this, response, options);
				});
			},
			params : opts.params
		});
	});
};
//*****************************************************
//方法名称:isNullOrEmpty
//处理内容:Null或者空判断
//参数 :strSrc 文字列
//返回值 :True - 检查OK False - 检查失敗
//*******************************************************
function isNullOrEmpty(strSrc) {
	if ((strSrc == null) || (strSrc == "") || (strSrc == "null")) {
		return true;
	} else {
		return false;
	}
}
//*******************************************************
//方法名称:trimSpace
//处理内容:Trim字符串
//参数 :sValue 字符串
//返回值 :Trim后的字符串
//*******************************************************
function trimSpace(sValue) {
	if ((sValue == null) || (sValue == "")) {
		return "";
	}
	var len1 = 0;
	var len2 = 1;
	while (len1 != len2) {
		len1 = sValue.length;
		sValue = sValue.replace(/(^\s*)|(\s*$)/g, "");
		sValue = sValue.replace(/(^\u3000*)|(\u3000*$)/g, "");
		len2 = sValue.length;
	}
	return sValue;
}
//*******************************************************
//方法名称:filterHtml
//处理内容:html字符的过滤处理
//参数 :strSrc 字符串
//返回值 :处理后的字符串
//*******************************************************
function filterHtml(strSrc) {
	var str = trimSpace(strSrc);
	var ch;
	var strResult = "";
	if (isNullOrEmpty(str)) {
		return strResult;
	}
	for (i = 0; i < str.length; i++) {
		ch = str.charAt(i);
		switch (ch) {
			case '<' :
				strResult = strResult.concat("&lt;");
				break;
			case '>' :
				strResult = strResult.concat("&gt;");
				break;
			case '"' :
				strResult = strResult.concat("&quot;");
				break;
			case '&' :
				strResult = strResult.concat("&amp;");
				break;
			case '\t' :
				break;
			default :
				strResult = strResult.concat(ch);
				break;
		}
	}
	return strResult;
}
/**
 * 禁用backspace键
 */
function forbidBackSpace() {
	if (window.event.keyCode == 8) {
		event.keyCode = 0; 
        event.cancelBubble = true; 
        return false; 
	}
}
function replaceStr(strSource, strFrom, strTo) {
	if (strSource == null || strSource == '') {
		return '';
	}
	if (strFrom == null || strFrom == '')
		return strSource;
	var fromLen = strFrom.length;
	var strDest = '';
	var intPos;
	while ((intPos = strSource.indexOf(strFrom)) != -1) {
		strDest = strDest + strSource.substring(0, intPos);
		strDest = strDest + strTo;
		strSource = strSource.substring(intPos + fromLen);
	}
	strDest = strDest + strSource;
	return strDest;
}
function replaceStrBefore(strSource, strFrom, strTo) {
	if (strSource == null || strSource == '') {
		return '';
	}
	if (strFrom == null || strFrom == '')
		return strSource;
	var fromLen = strFrom.length;
	var strDest = '';
	var intPos;
	while ((intPos = strSource.indexOf(strFrom)) != -1) {
		strDest = strDest + strSource.substring(0, intPos);
		strDest = strDest + strTo;
		strSource = strSource.substring(intPos + fromLen);
	}
	strDest = "^" + strDest + strSource;
	return strDest;
}
// 表单输入check
Ext.apply(
	Ext.form.VTypes,
	{
		// 日期范围
		daterange : function(val, field) {
			var date = field.parseDate(val);
			if (!date) {
				return;
			}
			if (field.startDateField
					&& (!this.dateRangeMax || (date.getTime() != this.dateRangeMax
							.getTime()))) {
				var start = Ext.getCmp(field.startDateField);
				start.setMaxValue(date);
				start.validate();
				this.dateRangeMax = date;
			} else if (field.endDateField
					&& (!this.dateRangeMin || (date.getTime() != this.dateRangeMin
							.getTime()))) {
				var end = Ext.getCmp(field.endDateField);
				end.setMinValue(date);
				end.validate();
				this.dateRangeMin = date;
			}
			return true;
		}
});

/**
 * 
 * 由一个控件的收缩和展开，引起另一个控件高度的调整，
 * 维持二者高度总和不变。
 * 
 * initiativeCtr 主动调整高度者
 * passiveCtr    被动影响者
 */
bbs.adjHeight = function(initiativeCtr,passiveCtr){
    this.iCtr = initiativeCtr;
    this.pIctr = passiveCtr;
    var getOffset = function(panel){
	    this.offset=panel.getSize().height -panel.header.getHeight();
	    this.iCtr.un('beforecollapse',getOffset,this);
	};
    this.iCtr.on('beforecollapse',getOffset,this);
    this.iCtr.on('collapse',function(panel){this.pIctr.setHeight(this.pIctr.getSize().height+this.offset);},this);
    this.iCtr.on('expand',function(panel){this.pIctr.setHeight(this.pIctr.getSize().height-this.offset);},this);
};


// 时间格式化 YYYY-MM-DD 
Date.prototype.toText=function(){ 
	var m; 
	var d; 
	if(this.getMonth() < 9){ 
	   m = "0" + (this.getMonth() + 1); 
	} else { 
	   m = this.getMonth()+1; 
	 } 
	if(this.getDate()<10){ 
	   d = "0" + this.getDate(); 
	} else { 
	   d = this.getDate(); 
	} 
	return this.getYear() + "-" + m + "-" + d; 
} 