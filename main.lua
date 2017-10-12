--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve 2shaKaBooty        GNU GPLv3         @Doyousketch2
Lo   = love
mou  = Lo .mouse             gra  = Lo .graphics
ima  = Lo .image             tou  = Lo .touch
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
WW  = gra .getWidth()        HH  = gra .getHeight()
w5  = WW *0.5                h5  = HH *0.5
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .load()
	image  = gra .newImage( 'twerk.png' )

	local w  = image :getWidth() /2
	local h  = image :getHeight() /2

  local verts = { -- {  x,   y,    u,   v  }
		                 {  0,   0,  0.5, 0.5  }, -- start in Center
		                 { -w,  -h,    0,   0  },  -- Left-Top
		                 {  w,  -h,    1,   0  },   -- Right-Top
		                 {  w,   h,    1,   1  },    -- Right-Bottom
		                 { -w,   h,    0,   1  },     -- Left-Bottom
		                 { -w,  -h,    0,   0  },  }   -- Left-Top again, to close

	mesh  = gra .newMesh( verts, 'fan' )
  mesh :setTexture( image )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .update()
  local x  = mou .getX() -w5
  local y  = mou .getY() -h5

  mesh :setVertex( 1,  x, y,  0.5, 0.5 )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .draw()
	gra .draw( mesh, w5, h5 )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
