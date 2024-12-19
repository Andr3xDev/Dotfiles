"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[1621],{25512:(e,t,n)=>{n.r(t),n.d(t,{HomeV2FullPageSection:()=>V,SKELETON_CARDS_COUNT:()=>F,default:()=>E});var a=n(30758),o=n(5993),s=n(97500),i=n.n(s),c=n(14343),r=n(31417),l=n(15292),m=n(92202),d=n(11472),u=n(96216),g=n(90124),h=n(6772),p=n(33712),S=n(81035),f=n(86070);const x=({section:e})=>(0,f.jsx)(p.p,{id:e.uri,title:e.data.title?.transformedLabel??"",showAll:!0,index:0,rowGap:h.lT,fullPage:!0,children:e.sectionItems.items.map(S.Gx)});var _=n(23046),j=n(80368),y=n(20489),H=n(42795);const w=({section:e})=>(0,f.jsx)(y.x,{config:(0,H.s1)(H.yV.HOME_LOW_DENSITY),children:(0,f.jsx)(p.p,{id:e.uri,title:e.data.title?.transformedLabel??"",showAll:!0,index:0,rowGap:(0,_.po)("looser"),fullPage:!0,children:e.sectionItems.items.map(j.G)})});var D=n(25408);const v=({section:e})=>(0,f.jsx)(y.x,{config:(0,H.s1)(H.yV.MUSIC_VIDEOS),children:(0,f.jsx)(p.p,{id:e.uri,title:r.Ru.get("music_videos"),showAll:!0,index:0,rowGap:(0,_.po)("looser"),fullPage:!0,children:e.sectionItems.items.map(((e,t)=>{if("TrackResponseWrapper"!==e.content.__typename||"Track"!==e.content.data.__typename)return null;const n=e.content.data;return(0,f.jsx)(D.O,{title:n.name,trackUri:n.uri,artists:n.artists.items,album:n.albumOfTrack,contentRating:n.contentRating,referrerIdentifier:"other",index:t},n.uri)}))})});var C=n(38501),I=n(85907);const O=({section:e})=>{const t=(0,c.NC)(C.hWV);switch("spotify:section:0JQ5DAnM3wGh0gz1MXnu3K"===e.uri&&t&&e.data&&(e.data.__typename="HomeGridSectionData"),e.data?.__typename){case"HomeGenericSectionData":return(0,f.jsx)(x,{section:(0,g.M)(e,e.data)});case"HomeMusicVideosSectionData":return(0,f.jsx)(v,{section:(0,g.M)(e,e.data)});case"HomeShortsSectionData":case"HomeRecentlyPlayedSectionData":case"HomeFeedBaselineSectionData":case"HomeNativeAdsSectionData":case"HomeOnboardingSectionData":return null;case"HomeGridSectionData":return t?(0,f.jsx)(w,{section:(0,g.M)(e,e.data)}):null;case"HomeSpotlightSectionData":case"HomePromotionSectionData":case null:case void 0:case"HomeFeatureActivationSectionData":case"HomeWatchFeedSectionData":case"HomeOnboardingSectionDataV2":case"HomeYourDJSectionData":return null;case"HomeFeatureActivationSectionDataV2":return(0,f.jsx)(u.G,{sectionItems:e.sectionItems.items,showAll:!0,uri:e.uri,localStorageKey:e.data.localStorageKey});default:return(0,I.k)(e.data),null}};var A=n(89737),b=n(99435);const N=(0,a.memo)((({cardCount:e})=>(0,f.jsx)(b._,{isLoading:!0,showAll:!0,withTitle:!0,children:[...new Array(e).keys()].map(((e,t)=>(0,f.jsx)(A.u,{isLoading:!0},t)))})));var P=n(6683),M=n(95175),T=n(81834),k=n(27963),G=n(61979),L=n(5062);const F=10,R=({uri:e})=>{const{request:t}=(0,a.useContext)(T.j),n=(0,c.NC)(C.MX4)?P.cT:P.T3,{data:s,isLoading:l,error:u}=(0,o.q)({queryKey:["homeV2","section",e,{numberOfItems:20}],queryFn:async({pageParam:a})=>(0,k.c)(t,d.U3,{uri:e,timeZone:(0,P.Ff)(),sp_t:(0,M.v8)("sp_t")??"",sectionItemsOffset:a,sectionItemsLimit:n}),initialPageParam:0,getNextPageParam:e=>{if("HomeSectionCollection"===e?.data?.homeSections?.__typename&&"HomeSection"===e.data.homeSections.sections[0]?.__typename){const t=e.data.homeSections.sections[0]?.sectionItems.pagingInfo;return t.nextOffset&&t.nextOffset>0?t.nextOffset:void 0}},gcTime:P.gO,staleTime:P.jl}),g=(0,a.useMemo)((()=>s?.pages?s.pages.reduce(((e,t)=>{if(!t?.data?.homeSections||"HomeSectionCollection"!==t?.data?.homeSections.__typename||0===t.data.homeSections.sections.length)return e;switch(t.data.homeSections.sections[0]?.__typename){case"HomeSection":return null===e?(0,G.h)(t.data.homeSections.sections[0]):(e.sectionItems.items=[...e.sectionItems.items,...t.data.homeSections.sections[0].sectionItems.items],e);case"GenericError":case"NotFound":return e;default:return(0,I.k)(t.data.homeSections.sections[0]),e}}),null):null),[s?.pages]);if(l)return(0,f.jsx)("section",{"data-testid":"home-page",children:(0,f.jsx)("div",{className:L.A.home,children:(0,f.jsx)("div",{className:i()(L.A.homepageContent,"contentSpacing"),children:(0,f.jsx)(N,{cardCount:F})})})});if(null!==u)return(0,f.jsx)(m.LoadingPage,{hasError:!0,errorMessage:r.Ru.get("error.generic")});const h=s?.pages[0]?.data?.homeSections;return"HomeSectionCollection"!==h?.__typename||0===h.sections.length||"HomeSection"!==h.sections[0]?.__typename||null===g?(0,f.jsx)(m.LoadingPage,{hasError:!0,errorMessage:r.Ru.get("error.generic")}):(0,f.jsx)("section",{"data-testid":"home-section-page",children:(0,f.jsx)("div",{className:L.A.home,children:(0,f.jsx)("div",{className:i()(L.A.homepageContent,"contentSpacing"),children:(0,f.jsx)(O,{section:g})})})})},V=({uri:e})=>(0,f.jsxs)(f.Fragment,{children:[(0,f.jsx)(l.Q,{children:r.Ru.get("page.generic-title")}),(0,f.jsx)(R,{uri:e})]}),E=V},61979:(e,t,n)=>{n.d(t,{h:()=>a});n(1903),n(40098);function a(e){return"object"!=typeof e||null===e?e:window.structuredClone?window.structuredClone(e):JSON.parse(JSON.stringify(e))}}}]);
//# sourceMappingURL=home-v2-section.js.map