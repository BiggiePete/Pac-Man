function sortTable(e){var r,t,a,n,o,s,i,T,L=0;for(r=document.getElementById("item_table"),a=!0,T="asc";a;){for(a=!1,t=r.rows,n=1;n<t.length-1;n++)if(i=!1,o=t[n].getElementsByTagName("TD")[e],s=t[n+1].getElementsByTagName("TD")[e],"asc"==T){if(o.innerHTML.toLowerCase()>s.innerHTML.toLowerCase()){i=!0;break}}else if("desc"==T&&o.innerHTML.toLowerCase()<s.innerHTML.toLowerCase()){i=!0;break}i?(t[n].parentNode.insertBefore(t[n+1],t[n]),a=!0,L++):0==L&&"asc"==T&&(T="desc",a=!0)}}