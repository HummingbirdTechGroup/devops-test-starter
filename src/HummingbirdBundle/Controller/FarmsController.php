<?php

namespace HummingbirdBundle\Controller;

use HummingbirdBundle\Entity\Farm;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class FarmsController extends Controller
{
    /**
     * @Route("/", name="farms")
     * @Template()
     *
     * @return array
     */
    public function showAction()
    {
        return ['farms' => $this->getDoctrine()->getManager()->getRepository(Farm::class)->findAll()];
    }
}
