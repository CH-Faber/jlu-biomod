<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProDetail.aspx.cs" Inherits="ProDetail" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>

<%--fastcontrol 0.1--%>
<%@ Register Src="~/UserControls/Top.ascx" TagName="Top" TagPrefix="ucTop" %>
<%@ Register Src="~/UserControls/Start.ascx" TagName="Start" TagPrefix="ucStart" %>
<%@ Register Src="~/UserControls/End.ascx" TagName="End" TagPrefix="ucEnd" %>
<!doctype html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <ucTop:Top ID="Top" runat="server" />
    <!--默认-->
    <script type="text/javascript" src="js/jqzoom.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.jqzoom').jqzoom({
                zoomType: 'standard',
                lens: true,
                preloadimages_red: false,
                alwaysOn: false
            });
        });
    </script>
    <link href="css/update.css" rel="stylesheet" type="text/css" />
    <!--jquery库-->
    <!--滚动、切换插件-->
    <script type="text/javascript" src="js/jQuery.blockUI.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
    <style type="text/css">
        /*proShow*/
        .product_show h2 {
            line-height: 28px;
            height: 28px;
            border-bottom: #ddd solid 1px;
            font-weight: normal;
            margin-bottom: 0px;
        }

            .product_show h2 strong {
                float: left;
                background: url("/images/title_04.gif") no-repeat;
                width: 97px;
                height: 28px;
                line-height: 28px;
                text-align: center;
                font-size: 14px;
                color: #fff;
            }

        .product_show ul li {
            width: 130px;
            line-height: 20px;
        }

        .product_show ul li {
            float: left;
            margin: 15px 20px 0;
            border: #e4e4e4 solid 1px;
            display: inline;
        }

        .product_zhanshi {
            margin-top: 20px;
        }

            .product_zhanshi dl {
                margin-left: 15px;
            }

                .product_zhanshi dl dt {
                    line-height: 36px;
                    font-size: 14px;
                }

                .product_zhanshi dl dd {
                    line-height: 28px;
                    border-bottom: #ddd dashed 1px;
                }

                    .product_zhanshi dl dd span {
                        color: #f90;
                        font-size: 14px;
                        font-weight: bold;
                        font-family: Verdana, Geneva, sans-serif;
                    }

        .xiangxi {
            margin-top: 20px;
        }

            .xiangxi h2 {
                height: 28px;
                font-size: 12px;
                line-height: 28px;
                color: #005895;
                border-bottom: #ddd solid 2px;
            }

                .xiangxi h2 strong {
                    float: left;
                    display: block;
                    border-bottom: #005895 solid 2px;
                    height: 28px;
                    padding: 0 0px;
                }

        .xiangxi_con {
            padding: 10px 0;
        }

            .xiangxi_con p {
                font-size: 14px;
            }

        .shangxia {
            height: 26px;
            padding-top: 10px;
        }

            .shangxia a {
                display: block;
                background: url(/images/pre.gif) no-repeat;
                width: 99px;
                height: 26px;
                text-align: center;
                line-height: 26px;
                font-size: 14px;
                color: #005895;
                font-weight: bold;
                float: right;
                margin-left: 16px;
                _margin-left: 8px;
            }

        .pro1 {
            width: 115px;
            height: 128px;
        }

            .pro1 td img {
                max-width: 115px;
                max-height: 100px;
                width: expression(this.width >115 && this.height < this.width ? 115: true);
                height: expression(this.height > 100 ? 100: true);
                border: 1px solid #ccc;
                padding: 5px
            }

        .pro2 {
            max-width: 288px;
            max-height: 216px;
            width: expression(this.width >288 && this.height < this.width ? 288: true);
            height: expression(this.height > 216 ? 216: true);
        }

        .pro3 {
            max-width: 64px;
            max-height: 48px;
            width: expression(this.width >64 && this.height < this.width ? 64: true);
            height: expression(this.height > 48 ? 48: true);
        }

        ul#thumblist li a {
            display: block;
            border: 1px solid #CCC;
            height: 54px;
            line-height: 54px;
        }

            ul#thumblist li a.zoomThumbActive {
                border: 1px solid #c00;
            }

        .clearfix ul li {
            float: left;
            width: 70px;
            margin: 0 2px;
            display: inline;
        }

            .clearfix ul li img {
                padding: 0;
                margin: 0;
                cursor: pointer;
            }

        .zoomPad {
            position: relative;
            z-index: 99;
            cursor: crosshair;
        }

        .zoomPreload {
            -moz-opacity: 0.8;
            opacity: 0.8;
            filter: alpha(opacity = 80);
            color: #333;
            font-size: 12px;
            font-family: Tahoma;
            text-decoration: none;
            border: 1px solid #CCC;
            background-color: white;
            padding: 8px;
            text-align: center;
            background-image: url(/images/zoomloader.gif);
            background-repeat: no-repeat;
            background-position: 43px 30px;
            z-index: 110;
            width: 90px;
            height: 43px;
            position: absolute;
            top: 0px;
            left: 0px;
            * width: 100px;
            * height: 49px;
        }

        .zoomPup {
            overflow: hidden;
            background-color: #FFF;
            -moz-opacity: 0.6;
            opacity: 0.6;
            filter: alpha(opacity = 60);
            z-index: 120;
            position: absolute;
            border: 1px solid #CCC;
            z-index: 101;
            cursor: crosshair;
        }

        .zoomOverlay {
            position: absolute;
            left: 0px;
            top: 0px;
            background: #FFF; /*opacity:0.5;*/
            z-index: 5000;
            width: 100%;
            height: 100%;
            display: none;
            z-index: 101;
        }

        .zoomWindow {
            position: absolute;
            left: 110%;
            top: 40px;
            background: #FFF;
            z-index: 6000;
            height: auto;
            z-index: 10000;
            z-index: 110;
        }

        .zoomWrapper {
            position: relative;
            border: 1px solid #999;
            z-index: 110;
        }

        .zoomWrapperTitle {
            display: block;
            background: #999;
            color: #FFF;
            height: 18px;
            line-height: 18px;
            width: 100%;
            overflow: hidden;
            text-align: center;
            font-size: 10px;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 120;
            -moz-opacity: 0.6;
            opacity: 0.6;
            filter: alpha(opacity = 60);
        }

        .zoomWrapperImage {
            display: block;
            position: relative;
            overflow: hidden;
            z-index: 110;
        }

            .zoomWrapperImage img {
                border: 0px;
                display: block;
                position: absolute;
                z-index: 101;
            }

        .zoomIframe {
            z-index: -1;
            filter: alpha(opacity=0);
            -moz-opacity: 0.80;
            opacity: 0.80;
            position: absolute;
            display: block;
        }

        .hover2 {
            background: #f4f4f4;
        }
    </style>
</head>
<body>
    <form id="form1">
        <ucStart:Start ID="Start" runat="server" />
        <!--Content Start-->
        <asp:Panel ID="ProZidingyi" runat="server" Width="100%">
        <div class="product_zhanshi">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                <tr>
                    <td align="center" valign="middle" style="width: 296px; position: relative;">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="center" valign="middle" style="height: 222px; width: 293px; background: #f4f4f4; border: #e4e4e4 solid 1px;">
                                    <div class="clearfix">
                                        <a href="/<%=strProPath %>" class="jqzoom" rel='gal1' title="产品">
                                            <img class="pro2" src="/<%=strProPath %>" alt="triumph" />
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    <div class="clearfix" style="margin-top: 10px;">
                                        <ul id="thumblist" class="clearfix">
                                            <li>
                                                <a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '/<%=strProPath %>',largeimage: '/<%=strProPath %>'}">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height: 54px;">
                                                        <tr>
                                                            <td valign="middle" align="center">
                                                                <img class="pro3" src='/<%=strProPath %>' alt="" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top">
                        <dl>
                            <dt><strong>
                                <%=strProName %>
                            </strong></dt>
                            <dd>
                                <strong>产品型号：</strong><%=strProBianhao %></dd>
                            <dd>
                                <strong>产品产地：</strong><%=strProChandi %></dd>
                             <dd>
                                <strong>产品价格：</strong><%=strProPrice %></dd>
                            <dd>
                                <strong>发布日期：</strong><%=strPutdate %></dd>
                            <dd>
                                <strong>浏览次数：</strong><script language="javascript" src="/check/pro_view.aspx?proid=<%=intID %>"></script>次</dd>
                            <dd>
                                <strong>咨询电话：</strong><span><%=strPhone %></span></dd>
                            <dd>
                                <strong>关 键 词：</strong><%=strKeywords %></dd>
                            <dd style="padding-top: 10px; height: 30px;">
                                <!-- JiaThis Button BEGIN -->
                                <div id="ckepop">
                                    <span class="jiathis_txt">分享到：</span>
                                    <a class="jiathis_button_qzone">QQ空间</a>
                                    <a class="jiathis_button_tsina">新浪微博</a>
                                    <a class="jiathis_button_tqq">腾讯微博</a>
                                    <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis"
                                        target="_blank">更多</a>
                                </div>
                                <script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
                                <!-- JiaThis Button END -->
                            </dd>
                            <dd style="border: none;" class="shangxia">
                                <a href="<%=strPreviousUrl %>">
                                    <%=strPrevious %>
                                </a>
                                <a href="<%=strNextUrl %>">
                                    <%=strNext %>
                                </a>
                            </dd>
                        </dl>
                    </td>
                </tr>
            </table>
        </div>
        <div class="xiangxi">
            <h2>
                <strong>详细介绍</strong></h2>
            <div class="xiangxi_con">
                <%=strProDescription %>
            </div>
        </div>



        </asp:Panel>

        <asp:Panel ID="ProMoban1" runat="server" Width="100%">
        <div class="update_prodetail_1">
        <div class="update_prodetail_1_top">
                <div class="swiper-container gallery-top update_gallery-top1">
                    <div class="swiper-wrapper">
                        <%for(int i=0;i<ConImg.Length;i++)
                            {%>
                        <div class="swiper-slide"><img src="<%=ConImg[i] %>"></div>
                        <%} %>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next swiper-button-white"></div>
                    <div class="swiper-button-prev swiper-button-white"></div>
                </div>
                <div class="swiper-container gallery-thumbs  update_gallery-thumbs1">
                    <div class="swiper-wrapper">
                        <%for(int i=0;i<ConImg.Length;i++)
                            {%>
                        <div class="swiper-slide"><img src="<%=ConImg[i] %>"></div>
                        <%} %>
                    </div>
                </div>
                <script>
                    var galleryThumbs = new Swiper('.update_gallery-thumbs1', {
                        spaceBetween: 10,
                        slidesPerView: 4,
                        freeMode: true,
                        loopedSlides: 5, //looped slides should be the same
                        watchSlidesVisibility: true,
                        watchSlidesProgress: true,
                    });
                    var galleryTop = new Swiper('.update_gallery-top1', {
                        spaceBetween: 10,
                        loop: true,
                        loopedSlides: 5, //looped slides should be the same
                        navigation: {
                            nextEl: '.swiper-button-next',
                            prevEl: '.swiper-button-prev',
                        },
                        thumbs: {
                            swiper: galleryThumbs,
                        },
                    });
                </script>
            
        </div>
        <div class="update_prodetail_1_con">
            <div class="update_slideTxtBox_02">
                    <div class="hd">
                        <ul>
                            <li>详细资料</li>
                            <li>规格参数</li>
                            <li>包装</li>
                        </ul>
                    </div>
                    <div class="bd">
                        <div class="xiangqing"><%=strProDescription %></div>
                        <div class="xiangqing"><%=content1 %></div>
                        <div class="xiangqing"><%=content2 %></div>
                    </div>
                </div>
                <script type="text/javascript">jQuery(".update_slideTxtBox_02").slide({ trigger: "click" });</script>
            <div class="update_prodetail_hot">
                <h2>为您推荐</h2>
                <ul>
                    <%for (int i = 0; i < intPro; i++)
                        {
                            string ProName = dtPro.Rows[i]["ProName"].ToString();
                            string ProBianhao = dtPro.Rows[i]["ProBianhao"].ToString();
                            string ProChandi = dtPro.Rows[i]["ProChandi"].ToString();
                            string ProPrice = dtPro.Rows[i]["ProPrice"].ToString();
                            string Keywords = dtPro.Rows[i]["Keywords"].ToString();
                            string ProId = dtPro.Rows[i]["ProId"].ToString();
                            string ProPath = dtPro.Rows[i]["ProPath"].ToString();
                            string Url = "ProDetail.aspx?Proid=" + ProId;
                    %>
                    <li><a href="<%=Url %>">
                        <img src="/<%=ProPath %>"><span><%=ProName %></span></a></li>
                    <%} %>
                </ul>
            </div>
        </div>
    </div>
        </asp:Panel>

        <asp:Panel ID="ProMoban2" runat="server" Width="100%">
        <div class="update_prodetail_2">
        <div class="update_prodetail_2_top">
            <div class="update_prodetail_1_top_left">
                <div class="swiper-container gallery-top update_gallery-top2">
                    <div class="swiper-wrapper">
                        <%for(int i=0;i<ConImg.Length;i++)
                            {%>
                        <div class="swiper-slide"><img src="<%=ConImg[i] %>"></div>
                        <%} %>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next swiper-button-white"></div>
                    <div class="swiper-button-prev swiper-button-white"></div>
                </div>
                <div class="swiper-container gallery-thumbs update_gallery-thumbs2">
                    <div class="swiper-wrapper">
                       <%for(int i=0;i<ConImg.Length;i++)
                            {%>
                        <div class="swiper-slide"><img src="<%=ConImg[i] %>"></div>
                        <%} %>
                    </div>
                </div>
                <script>
                    var galleryThumbs = new Swiper('.update_gallery-thumbs2', {
                        spaceBetween: 10,
                        slidesPerView: 4,
                        freeMode: true,
                        loopedSlides: 5, //looped slides should be the same
                        watchSlidesVisibility: true,
                        watchSlidesProgress: true,
                    });
                    var galleryTop = new Swiper('.update_gallery-top2', {
                        spaceBetween: 10,
                        loop: true,
                        loopedSlides: 5, //looped slides should be the same
                        navigation: {
                            nextEl: '.swiper-button-next',
                            prevEl: '.swiper-button-prev',
                        },
                        thumbs: {
                            swiper: galleryThumbs,
                        },
                    });
                </script>
            </div>
            <div class="update_prodetail_1_top_right">
                <dl>
                    <dt><%=strProName %></dt>
                    <dd>产品型号：<%=strProBianhao %></dd>
                    <dd>产品产地：<%=strProChandi %></dd>
                    <dd>发布日期：<%=strPutdate %></dd>
                    <dd>浏览次数：<script language="javascript" src="/check/pro_view.aspx?proid=<%=intID %>"></script>次</dd>
                </dl>
                 <div class="update_detail_bot"><a class="prev" href="<%=strPreviousUrl %>">上一个：<%=strPrevious %></a><a class="next" href="<%=strNextUrl %>">下一个：<%=strNext %></a></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="update_prodetail_2_con">
            <div class="update_slideTxtBox_03">
                    <div class="hd">
                        <ul>
                            <li>详细资料</li>
                            <li>规格参数</li>
                            <li>包装</li>
                        </ul>
                    </div>
                    <div class="bd">
                        <div class="xiangqing"><%=strProDescription %></div>
                        <div class="xiangqing"><%=content1 %></div>
                        <div class="xiangqing"><%=content2 %></div>
                    </div>
                </div>
                <script type="text/javascript">jQuery(".update_slideTxtBox_03").slide({ trigger: "click" });</script>
            
            <div class="clear"></div>
        </div>
        <div class="update_prodetail_hot">
                <h2>为您推荐</h2>
                <ul>
                    <%for (int i = 0; i < intPro; i++)
                        {
                            string ProName = dtPro.Rows[i]["ProName"].ToString();
                            string ProBianhao = dtPro.Rows[i]["ProBianhao"].ToString();
                            string ProChandi = dtPro.Rows[i]["ProChandi"].ToString();
                            string ProPrice = dtPro.Rows[i]["ProPrice"].ToString();
                            string Keywords = dtPro.Rows[i]["Keywords"].ToString();
                            string ProId = dtPro.Rows[i]["ProId"].ToString();
                            string ProPath = dtPro.Rows[i]["ProPath"].ToString();
                            string Url = "ProDetail.aspx?Proid=" + ProId;
                    %>
                    <li><a href="<%=Url %>">
                        <img src="/<%=ProPath %>"><span><%=ProName %></span></a></li>
                    <%} %>
                </ul>
            </div>
    </div>
        </asp:Panel>

        <asp:Panel ID="ProMoban3" runat="server" Width="100%">
        <div class="update_prodetail_3">
            <div class="update_prodetail_3_top">
                <div class="update_prodetail_3_top_left">
                    <div class="swiper-container update_swiper-container">
                        <div class="swiper-wrapper">
                            <%for (int i = 0; i < ConImg.Length; i++)
                                {%>
                            <div class="swiper-slide">
                                <img src="<%=ConImg[i] %>"></div>
                            <%} %>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                    <!-- Initialize Swiper -->
                    <script>
                        var swiper = new Swiper('.update_swiper-container', {
                            pagination: {
                                el: '.swiper-pagination',
                                type: 'fraction',
                            },
                            navigation: {
                                nextEl: '.swiper-button-next',
                                prevEl: '.swiper-button-prev',
                            },
                        });
                    </script>
                </div>
                <div class="update_prodetail_3_top_right">
                    <dl>
                        <dt><%=strProName%></dt>
                        <dd class="update_prodetail_3_jj"><%=strProKeyDescription %></dd>
                        <dd class="update_prodetail_3_tel"><strong>全国热线<br />
                            <%=strPhone %></strong><a href="tencent://message/?uin=<%=strQQ %>&Site=Sambow&Menu=yes">在线咨询</a></dd>
                    </dl>
                    <div class="update_detail_bot"><a class="prev" href="<%=strPreviousUrl %>">上一个：<%=strPrevious %></a><a class="next" href="<%=strNextUrl %>">下一个：<%=strNext %></a></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="update_prodetail_3_con">
                <div class="update_prodetail_3_nr">
                    <h2><span>详细资料</span></h2>
                    <div class="update_prodetail_3_desc"><%=strProDescription %></div>
                </div>
                <div class="update_prodetail_3_nr">
                    <h2><span>规格参数</span></h2>
                    <div class="update_prodetail_3_desc"><%=content1 %></div>
                </div>
                <div class="update_prodetail_3_nr">
                    <h2><span>包装</span></h2>
                    <div class="update_prodetail_3_desc"><%=content2 %></div>
                </div>
            </div>
            <div class="update_prodetail_hot">
                <h2>为您推荐</h2>
                <ul>
                    <%for (int i = 0; i < intPro; i++)
                        {
                            string ProName = dtPro.Rows[i]["ProName"].ToString();
                            string ProBianhao = dtPro.Rows[i]["ProBianhao"].ToString();
                            string ProChandi = dtPro.Rows[i]["ProChandi"].ToString();
                            string ProPrice = dtPro.Rows[i]["ProPrice"].ToString();
                            string Keywords = dtPro.Rows[i]["Keywords"].ToString();
                            string ProId = dtPro.Rows[i]["ProId"].ToString();
                            string ProPath = dtPro.Rows[i]["ProPath"].ToString();
                            string Url = "ProDetail.aspx?Proid=" + ProId;
                    %>
                    <li><a href="<%=Url %>">
                        <img src="/<%=ProPath %>"><span><%=ProName %></span></a></li>
                    <%} %>
                </ul>
            </div>
        </div>
        </asp:Panel>


        <!--Content End-->
        <ucEnd:End ID="End" runat="server" />
    </form>
</body>
</html>

